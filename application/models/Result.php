<?php
    /**
     * File Description here.
     * Author: Mfawa Alfred Onen
     * Date: 5/1/13
     * Version: v1.0
     * File: user.php
     */

    class Result extends Basemodel
    {

//  Validation Rules
        private static $new_fa_assessment_rules = array(
            'score' => 'required|numeric|max:20',
        );
        private static $new_sta_assessment_rules = array(
            'score' => 'required|numeric|max:10',
        );
        private static $new_exam_assessment_rules = array(
            'score' => 'required|numeric|max:60',
        );
        private static $new_question_rules = array(
            'question_title' => 'required|min:3|max:255',
            'question_file'  => 'required|mimes:pdf,doc,docx',
        );
        private static $new_assignment_rules = array(
            'title'   => 'required|min:3|max:255',
            'an_file' => 'required|mimes:pdf,doc,docx',
        );
        private static $new_assignment_submission_rules = array(
            'final_submission' => 'accepted',
            'assignment_file'  => 'required|mimes:pdf,doc,docx',
        );
        private static $assignment_score_rules = array(
            'score' => 'required|max:100|min:0',
        );


//  Validation

        public static function new_fa_assessment_validation($input)
        {
            return static::validation($input, static::$new_fa_assessment_rules);
        }

        public static function new_sta_assessment_validation($input)
        {
            return static::validation($input, static::$new_sta_assessment_rules);
        }

        public static function new_exam_assessment_validation($input)
        {
            return static::validation($input, static::$new_exam_assessment_rules);
        }

        public static function new_question_validation($input)
        {
            return static::validation($input, static::$new_question_rules);
        }

        public static function new_assignment_validation($input)
        {
            if ($input['an_type'] == 2) {
                static::$new_assignment_rules['submission_deadline'] = 'required|date_format:Y-m-d H\\:i\\:s';
            }
            return static::validation($input, static::$new_assignment_rules);
        }

        public static function new_assignment_submission_validation($input)
        {
            return static::validation($input, static::$new_assignment_submission_rules);
        }

        public static function assignment_score_validation($input)
        {
            return static::validation($input, static::$assignment_score_rules);
        }

        public static function attendance_validation($input)
        {
            if ($input['attendance_type_id'] == 3) {
                return static::validation($input, array('attendance_reason' => 'required|min:3'));
            } else {
                return TRUE;
            }
        }

//  DB Inserts

        public static function new_assessment($data)
        {
            $admission_no            = Ais::resolve_admission_no_from_userid($data['user_id']);
            $assessment_array        = array(
                'admission_no'        => $admission_no,
                'subject_id'          => $data['subject_id'],
                'class_id'            => $data['class_id'],
                'academic_session_id' => Ais::active_academic_session(),
                'term_id'             => Ais::active_term(),
                'assessment_type_id'  => $data['assessment_type_id'],
                'score'               => $data['score'],
            );
            $assessment_update_array = array('score' => $data['score']);
            if (static::check_assessment_exist_for_student($admission_no, $data['class_id'], $data['subject_id'], $data['assessment_type_id'])) {
                $assessment = DB::table('results')->where('admission_no', '=', $admission_no)
                    ->where('assessment_type_id', '=', $data['assessment_type_id'])
                    ->update($assessment_update_array);
            } else {
                $assessment = DB::table('results')->insert($assessment_array);
            }
            if ($assessment) {
                return $assessment;
            } else {
                return FALSE;
            }

        }

        protected static function check_assessment_exist_for_student($admission_no, $class_id, $subject_id, $assessment_type)
        {
            $count = DB::table('results')->where('admission_no', '=', $admission_no)
                ->where('class_id', '=', $class_id)
                ->where('subject_id', '=', $subject_id)
                ->where('assessment_type_id', '=', $assessment_type)
                ->count();
            if ($count > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        }

//  DB Updates

//  DB Deletes

//  Secondary DB Queries

        public static function student_assessments($id, $subject_id, $class_id, $term_id, $formatted = FALSE)
        {
            $admission_no = Ais::resolve_admission_no_from_userid($id);
            $assessments  = DB::table('results')
                ->where('admission_no', '=', $admission_no)
                ->where('class_id', '=', $class_id)
                ->where('subject_id', '=', $subject_id)
                ->where('term_id', '=', $term_id)
                ->get();
            if ($assessments) {
                $assessment_title = '';
                if ($formatted) {
                    foreach ($assessments as $assessment) {
                        $assessment_title .= ', ' . Expand::assessment_type($assessment->assessment_type_id) . ' - ( ' . $assessment->score . ' )';
                    }
                    return substr($assessment_title, 1);
                } else {
                    return $assessments;
                }
            } else {
                return null;
            }
        }

        public static function teacher_subjects()
        {
            $user_id  = Session::get('user_id');
            $subjects = DB::table('teachers_and_subjects')->where('user_id', '=', $user_id)->get();
            if ($subjects) {
                return $subjects;
            } else {
                return null;
            }
        }

        public static function assessment($subject_id, $class_id)
        {
            $subjects = '';
            if ($subjects) {
                return $subjects;
            } else {
                return null;
            }
        }

        public static function publish_result($student_id, $subject_id, $class_id, $term_id)
        {
            return static::result_publish_status($student_id, $subject_id, $class_id, $term_id, 2);
        }

        protected static function result_publish_status($student_id, $subject_id, $class_id, $term_id, $status)
        {
            $admission_no        = Ais::resolve_admission_no_from_userid($student_id);
            $academic_session_id = Ais::active_academic_session();
            $result              = DB::table('results')->where('admission_no', '=', $admission_no)
                ->where('subject_id', '=', $subject_id)
                ->where('class_id', '=', $class_id)
                ->where('term_id', '=', $term_id)
                ->where('academic_session_id', '=', $academic_session_id)
                ->update(array('published' => $status));
            if ($result) {
                return TRUE;
            } else {
                return FALSE;
            }
        }

        public static function unpublish_result($student_id, $subject_id, $class_id, $term_id)
        {
            return static::result_publish_status($student_id, $subject_id, $class_id, $term_id, 1);
        }

        public static function student_result_biodata()
        {
            $user_id = Session::get('user_id');
            $student = DB::table('users')
                ->left_join('biodata', 'users.id', '=', 'biodata.user_id')
                ->where('users.id', '=', $user_id)
                ->first(array('users.id', 'firstname', 'surname', 'age', 'gender_id', 'current_class_id'));
            if ($student) {
                return $student;
            } else {
                return null;
            }
        }

        public static function result_report($subject_id, $class_id, $term_id)
        {
            $results         = array();
            $student_results = static::registered_students_in_class($class_id);
            if ($student_results) {
                foreach ($student_results as $result) {
                    $admission_no = Ais::resolve_admission_no_from_userid($result->id);
                    $results[]    = array(
                        'student_id'      => $result->id,
                        'firstname'       => $result->firstname,
                        'surname'         => $result->surname,
                        'first_ca_score'  => Expand::ca_exam_score($result->id, $subject_id, $class_id, $term_id, 1),
                        'second_ca_score' => Expand::ca_exam_score($result->id, $subject_id, $class_id, $term_id, 2),
                        'third_ca_score'  => Expand::ca_exam_score($result->id, $subject_id, $class_id, $term_id, 3),
                        'exam_score'      => Expand::ca_exam_score($result->id, $subject_id, $class_id, $term_id, 4),
                        'total'           => Expand::ca_exam_total($result->id, $subject_id, $class_id, $term_id),
                        'grade'           => Expand::ca_exam_grade(Expand::ca_exam_total($result->id, $subject_id, $class_id, $term_id))['grade'],
                        'comment'         => Expand::ca_exam_grade(Expand::ca_exam_total($result->id, $subject_id, $class_id, $term_id))['comment'],
                        'publish_status'  => static::check_publish_status($admission_no, $class_id, $subject_id, $term_id),
                    );

                }
                return $results;
            } else {
                return null;
            }
        }

        public static function registered_students_in_class($class_id, $num = FALSE)
        {
            $registered_students = DB::table('users')
                ->left_join('biodata', 'users.id', '=', 'biodata.user_id')
                ->where('biodata.current_class_id', '=', $class_id)
                ->get(array(
                    'users.id', 'users.firstname', 'users.surname', 'biodata.age', 'biodata.gender_id'
                ));
            if ($registered_students) {
                if ($num) {
                    return count($registered_students);
                }
                return $registered_students;
            } else {
                return null;
            }
        }

        protected static function check_publish_status($admission_no, $class_id, $subject_id, $term_id)
        {
            $results = DB::table('results')->where('admission_no', '=', $admission_no)
                ->where('class_id', '=', $class_id)
                ->where('subject_id', '=', $subject_id)
                ->where('term_id', '=', $term_id)
                ->get(array('published'));
            $count   = 0;
            foreach ($results as $result) {
                if ($result->published == 2) {
                    $count++;
                }
            }
            if ($count > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        }

        public static function term_result_report($term_id)
        {
            $results             = array();
            $user_id             = Session::get('user_id');
            $academic_session_id = Ais::active_academic_session();
            $class_id            = Ais::resolve_classid_from_userid($user_id);
            $subject_results     = static::registered_subjects_result($user_id, $class_id, $term_id, $academic_session_id);
            if (!is_null($subject_results)) {
                foreach ($subject_results as $subject) {
                    $total     = Expand::ca_exam_total($user_id, $subject->subject_id, $class_id, $term_id);
                    $pos       = static::position_per_subject($subject->subject_id, $class_id, $term_id);
                    $results[] = array(
                        'subject'         => Expand::subject($subject->subject_id),
                        'first_ca_score'  => Expand::ca_exam_score($user_id, $subject->subject_id, $class_id, $term_id, 1),
                        'second_ca_score' => Expand::ca_exam_score($user_id, $subject->subject_id, $class_id, $term_id, 2),
                        'third_ca_score'  => Expand::ca_exam_score($user_id, $subject->subject_id, $class_id, $term_id, 3),
                        'exam_score'      => Expand::ca_exam_score($user_id, $subject->subject_id, $class_id, $term_id, 4),
                        'total'           => $total,
                        'grade'           => Expand::ca_exam_grade($total)['grade'],
                        'comment'         => Expand::ca_exam_grade($total)['comment'],
                        'out_of'          => static::total_students_per_subject($subject->subject_id, $class_id, $term_id),
                        'class_average'   => static::class_average_per_subject($subject->subject_id, $class_id, $term_id),
                        'pos'             => ($pos[$total] + 1),
                    );

                }
                return $results;
            } else {
                return null;
            }
        }

        public static function registered_subjects_result($user_id, $class_id, $term_id, $academic_session_id)
        {
            $admission_no        = Ais::resolve_admission_no_from_userid($user_id);
            $registered_subjects = DB::table('results')
                ->where('admission_no', '=', $admission_no)
                ->where('class_id', '=', $class_id)
                ->where('term_id', '=', $term_id)
                ->where('academic_session_id', '=', $academic_session_id)
                ->where('published', '=', 2)
                ->group_by('subject_id')
                ->get();
            if ($registered_subjects) {
                return $registered_subjects;
            } else {
                return null;
            }
        }

        protected static function position_per_subject($subject_id, $class_id, $term_id)
        {
            $total = DB::query('SELECT SUM(score) AS total_score FROM results WHERE subject_id = ? AND published = ? AND class_id = ? AND term_id = ? GROUP BY admission_no;', array($subject_id, 2, $class_id, $term_id));
            if ($total) {
                $total_scores = array();
                foreach ($total as $t) {
                    $total_scores[] = $t->total_score;
                }
                //$total_scores default
                natsort($total_scores);
                $total_scores = array_reverse($total_scores);
                $inv          = array();
                foreach ($total_scores as $k => $v) {
                    $inv[$v] = $k;
                }
                return $inv;
            } else {
                return 0;
            }
        }

        protected static function total_students_per_subject($subject_id, $class_id, $term_id)
        {
            $total = DB::table('results')->where('subject_id', '=', $subject_id)
                ->where('published', '=', 2)
                ->where('class_id', '=', $class_id)
                ->where('term_id', '=', $term_id)
                ->where('assessment_type_id', '=', 4)
                ->group_by('admission_no')->get('admission_no');
            if ($total) {
                return count($total);
            } else {
                return 0;
            }
        }

        protected static function class_average_per_subject($subject_id, $class_id, $term_id)
        {
            $total = static::total_score($subject_id, $class_id, $term_id);
            if ($total > 0) {
                $total_scores   = $total;
                $total_students = static::total_students_per_subject($subject_id, $class_id, $term_id);
                $class_average  = round(($total_scores / $total_students), 2);
                return (float)$class_average;
            } else {
                return 0;
            }
        }

        protected static function total_score($subject_id, $class_id, $term_id)
        {
            $total = DB::table('results')->where('subject_id', '=', $subject_id)
                ->where('published', '=', 2)
                ->where('class_id', '=', $class_id)
                ->where('term_id', '=', $term_id)
                ->group_by('subject_id')->sum('score');
            if ($total) {
                return $total;
            } else {
                return 0;
            }
        }

        public static function result_class_average($user_id = '', $term_id = '')
        {
            $user_id  = empty($user_id) ? Session::get('user_id') : $user_id;
            $class_id = Ais::resolve_classid_from_userid($user_id);
            $term_id  = empty($term_id) ? Ais::active_term() : $term_id;
            $students = static::registered_students_in_class($class_id);
            if ($students) {
                $ave = array();
                foreach ($students as $student) {
                    $total_score     = static::student_subjects_total_score($student->id, $term_id);
                    $subject_offered = static::subjects_offered($student->id, $term_id);
                    if ($total_score > 0 && $subject_offered > 0) {
                        $ave[] = ($total_score / $subject_offered);
                    }
                }
                if (!empty($ave)) {
                    return array('highest_average' => number_format(max($ave), 2), 'lowest_average' => number_format(min($ave), 2));
                } else {
                    return array('highest_average' => 0, 'lowest_average' => 0);
                }

            } else {
                return array('highest_average' => 0, 'lowest_average' => 0);
            }
        }

        public static function student_subjects_total_score($user_id = '', $term_id = '')
        {
            $user_id             = empty($user_id) ? Session::get('user_id') : $user_id;
            $class_id            = Ais::resolve_classid_from_userid($user_id);
            $term_id             = empty($term_id) ? Ais::active_term() : $term_id;
            $academic_session_id = Ais::active_academic_session();
            $subjects            = static::registered_subjects_result($user_id, $class_id, $term_id, $academic_session_id);
            if ($subjects) {
                $total = 0;
                foreach ($subjects as $subject) {
                    $total += static::total_score_per_student($subject->subject_id, $class_id, $term_id, $user_id);
                }
                return $total;
            } else {
                return 0;
            }
        }

        protected static function total_score_per_student($subject_id, $class_id, $term_id, $user_id = '')
        {
            $user_id      = empty($user_id) ? Session::get('user_id') : $user_id;
            $admission_no = Ais::resolve_admission_no_from_userid($user_id);
            $total        = DB::table('results')->where('subject_id', '=', $subject_id)
                ->where('admission_no', '=', $admission_no)
                ->where('published', '=', 2)
                ->where('class_id', '=', $class_id)
                ->where('term_id', '=', $term_id)
                ->group_by('subject_id')->sum('score');
            if ($total) {
                return $total;
            } else {
                return 0;
            }
        }

        public static function subjects_offered($user_id = '', $term_id = '')
        {
            $user_id             = empty($user_id) ? Session::get('user_id') : $user_id;
            $admission_no        = Ais::resolve_admission_no_from_userid($user_id);
            $class_id            = Ais::resolve_classid_from_userid($user_id);
            $term_id             = empty($term_id) ? Ais::active_term() : $term_id;
            $academic_session_id = Ais::active_academic_session();
            $subjects_count      = DB::table('results')->where('admission_no', '=', $admission_no)
                ->where('class_id', '=', $class_id)
                ->where('term_id', '=', $term_id)
                ->where('academic_session_id', '=', $academic_session_id)
                ->group_by('subject_id')
                ->get(array('subject_id'));
            if ($subjects_count) {
                return count($subjects_count);
            } else {
                return 0;
            }

        }

        public static function position_per_class($user_id = '', $term_id = '')
        {
            $user_id  = empty($user_id) ? Session::get('user_id') : $user_id;
            $term_id  = empty($term_id) ? Ais::active_term() : $term_id;
            $class_id = Ais::resolve_classid_from_userid($user_id);
            $students = static::registered_students_in_class($class_id);
            if ($students) {
                $ave = array();
                foreach ($students as $student) {
                    $ave[] = static::student_final_average($student->id, $term_id);
                }
                natsort($ave);
                $ave = array_reverse($ave);
                $pos = array_keys($ave, static::student_final_average($user_id, $term_id));
                return $pos[0] + 1;
            } else {
                return 0;
            }
        }

        public static function student_final_average($user_id = '', $term_id = '')
        {
            $user_id          = empty($user_id) ? Session::get('user_id') : $user_id;
            $term_id          = empty($term_id) ? Ais::active_term() : $term_id;
            $subjects_offered = Result::subjects_offered($user_id, $term_id);
            $total_score      = Result::student_subjects_total_score($user_id, $term_id);
            if ($subjects_offered > 0 && $total_score > 0) {
                return ($total_score / $subjects_offered);
            } else {
                return 0;
            }
        }

        public static function final_grade($user_id = '', $term_id = '')
        {
            // Check if there is result for this Academic Session and Term
            $session       = Ais::active_academic_session();
            $user_id       = empty($user_id) ? Session::get('user_id') : $user_id;
            $term_id       = empty($term_id) ? Ais::active_term() : $term_id;
            $admission_no  = Ais::resolve_admission_no_from_userid($user_id);

            $count = DB::table('results')
                    ->where('admission_no','=',$admission_no)
                    ->where('term_id','=',$term_id)
                    ->where('academic_session_id','=', $session)
                    ->where('published','=',2)
                    ->count();
            if($count > 0){
                $final_average = static::student_final_average($user_id, $term_id);
                return Expand::ca_exam_grade($final_average);
            } else {
                return 0;
            }

        }

        public static function new_question($data)
        {
            $user_id         = Session::get('user_id');
            $abs_path        = '/uploads/questions_bank';
            $user_upload_dir = path('public') . DS . $abs_path;
            $ext             = explode('.', File::extension($data['question_file']['name']));
            $filename        = strtolower(str_replace(' ', '_', $data['question_title'])) . '.' . $ext[0];
            if (!file_exists($user_upload_dir)) {
                mkdir($user_upload_dir, 0777, TRUE);
            }
            // Upload file to folder
            $upload = Input::upload('question_file', $user_upload_dir, $filename);
            if ($upload) {
                // Insert DB Records
                $new_question = array(
                    'user_id'            => $user_id,
                    'class_id'           => $data['class_id'],
                    'subject_id'         => $data['subject_id'],
                    'question_title'     => Str::title($data['question_title']),
                    'question_file_path' => $abs_path . '/' . $filename,
                );
                $question     = DB::table('questions_bank')->insert($new_question);
                if ($question) {
                    return $question;
                } else {
                    return FALSE;
                }
            } else {
                return FALSE;
            }
        }

        public static function new_assignment($data)
        {
            $user_id         = Session::get('user_id');
            $abs_path        = '/uploads/assignments';
            $user_upload_dir = path('public') . DS . $abs_path;
            $ext             = explode('.', File::extension($data['an_file']['name']));
            $filename        = strtolower(str_replace(' ', '_', $data['title'])) . '.' . $ext[0];
            if (!file_exists($user_upload_dir)) {
                mkdir($user_upload_dir, 0777, TRUE);
            }
            // Upload file to folder
            $upload = Input::upload('an_file', $user_upload_dir, $filename);
            if ($upload) {
                // Insert DB Records
                $new_assignment = array(
                    'user_id'      => $user_id,
                    'an_type'      => $data['an_type'],
                    'class_id'     => $data['class_id'],
                    'subject_id'   => $data['subject_id'],
                    'title'        => Str::title($data['title']),
                    'an_file_path' => $abs_path . '/' . $filename,
                );
                if ($data['an_type'] == 2) {
                    $new_assignment['submission_deadline'] = $data['submission_deadline'];
                }
                $assignment = DB::table('assignments_and_notes')->insert($new_assignment);
                if ($assignment) {
                    return $assignment;
                } else {
                    return FALSE;
                }
            } else {
                return FALSE;
            }
        }

        public static function assignment_score($data)
        {
            $score      = array('assignment_score' => $data['score'],);
            $assignment = DB::table('assignment_submissions')->where('assignment_id', '=', $data['assignment_id'])
                ->where('user_id', '=', $data['user_id'])
                ->where('id', '=', $data['submission_id'])
                ->update($score);
            if ($assignment) {
                return $assignment;
            } else {
                return FALSE;
            }
        }

        public static function attendance($data)
        {
            date_default_timezone_set('Africa/Lagos');
            $attendance = array(
                'attendance_type_id'  => $data['attendance_type_id'],
                'user_id'             => Session::get('user_id'),
                'admission_no'        => Ais::resolve_admission_no_from_userid($data['user_id']),
                'attendance_date'     => date('Y-m-d H:i:s'),
                'term_id'             => $data['term_id'],
                'class_id'            => $data['class_id'],
                'subject_id'          => $data['subject_id'],
                'academic_session_id' => Ais::active_academic_session(),
            );
            if ($data['attendance_type_id'] == 3) {
                $attendance['attendance_reason'] = $data['attendance_reason'];
            }
            $result = DB::table('class_attendance')->insert($attendance);
            if ($result) {
                return $result;
            } else {
                return FALSE;
            }
        }

        public static function attendance_list($subject_id, $class_id, $term_id)
        {
            $role_id             = Session::get('role_id');
            $user_id             = Session::get('user_id');
            $academic_session_id = Ais::active_academic_session();
            if ($role_id == 1) {
                $admission_no = Ais::resolve_admission_no_from_userid($user_id);
                $query        = 'SELECT class_attendance.*, COUNT(admission_no) AS attendance_count
            FROM class_attendance
            WHERE admission_no = ?
            AND class_id = ?
            AND term_id = ?
            AND subject_id = ?
            AND academic_session_id = ?
            GROUP BY admission_no';
                $attendance   = DB::query($query, array($admission_no, $class_id, $term_id, $subject_id, $academic_session_id));
            } elseif ($role_id == 2) {
                $query      = 'SELECT class_attendance.*, COUNT(admission_no) AS attendance_count
            FROM class_attendance
            WHERE user_id = ?
            AND class_id = ?
            AND term_id = ?
            AND subject_id = ?
            AND academic_session_id = ?
            GROUP BY admission_no';
                $attendance = DB::query($query, array($user_id, $class_id, $term_id, $subject_id, $academic_session_id));
            } else {
                $query      = 'SELECT class_attendance.*, COUNT(admission_no) AS attendance_count
            FROM class_attendance
            WHERE class_id = ?
            AND term_id = ?
            AND subject_id = ?
            AND academic_session_id = ?
            GROUP BY admission_no';
                $attendance = DB::query($query, array($class_id, $term_id, $subject_id, $academic_session_id));
            }
            if ($attendance) {
                return $attendance;
            } else {
                return null;
            }
        }

        public static function new_assignment_submission($data)
        {
            $user_id         = Session::get('user_id');
            $abs_path        = '/uploads/assignments/submissions/' . $user_id;
            $user_upload_dir = path('public') . DS . $abs_path;
            $ext             = explode('.', File::extension($data['assignment_file']['name']));
            $filename        = strtolower(str_replace(' ', '_', 'assignment_submission_' . time() . '_' . $user_id . '_' . $data['assignment_id'])) . '.' . $ext[0];
            if (!file_exists($user_upload_dir)) {
                mkdir($user_upload_dir, 0777, TRUE);
            }
            // Upload file to folder
            $upload = Input::upload('assignment_file', $user_upload_dir, $filename);
            if ($upload) {
                // Insert DB Records
                date_default_timezone_set('Africa/lagos');
                $new_assignment = array(
                    'user_id'              => $user_id,
                    'assignment_id'        => $data['assignment_id'],
                    'submission_date'      => date('Y-m-d H:i:s'),
                    'assignment_file_path' => $abs_path . '/' . $filename,
                );
                $assignment     = DB::table('assignment_submissions')->insert($new_assignment);
                if ($assignment) {
                    return $assignment;
                } else {
                    return FALSE;
                }
            } else {
                return FALSE;
            }
        }

        public static function all_questions()
        {
            $user_id = Session::get('user_id');
            if (Session::get('role_id') == 2) {
                $questions = DB::table('questions_bank')->where('user_id', '=', $user_id)->get();
            } else {
                $questions = DB::table('questions_bank')->get();
            }
            return $questions;
        }

        public static function all_assignments()
        {
            $user_id = Session::get('user_id');
            if (Session::get('role_id') == 2) {
                $class_id    = Ais::resolve_classid_from_teacher_userid_for_subjects($user_id);
                $assignments = DB::table('assignments_and_notes')->where('user_id', '=', $user_id)->where('class_id', '=', $class_id)->get();
            } elseif (Session::get('role_id') == 1) {
                $class_id    = Ais::resolve_classid_from_userid($user_id);
                $assignments = DB::table('assignments_and_notes')->where('class_id', '=', $class_id)->get();
            } else {
                $assignments = DB::table('assignments_and_notes')->get();
            }
            return $assignments;
        }

        public static function all_assignment_submissions()
        {
            $user_id = Session::get('user_id');
            if (Session::get('role_id') == 1) {
                $assignments = DB::table('assignment_submissions')->where('user_id', '=', $user_id)->get();
            } else {
                $assignments = DB::table('assignment_submissions')
                    ->join('assignments_and_notes', 'assignment_submissions.assignment_id', '=', 'assignments_and_notes.id')
                    ->where('assignments_and_notes.user_id', '=', $user_id)
                    ->get(array('assignment_submissions.*'));
            }
            return $assignments;
        }

        public static function delete_question($question_id, $question_name)
        {
            $dir    = path('public') . DS . '/uploads/questions_bank/';
            $status = File::delete($dir . base64_decode($question_name));
            if ($status == null) {
                return FALSE;
            } else {
                $question = DB::table('questions_bank')->delete($question_id);
                if ($question) {
                    return $question;
                } else {
                    return FALSE;
                }
            }
        }

        public static function delete_assignment($id, $file_name)
        {
            $dir    = path('public') . DS . '/uploads/assignments/';
            $status = File::delete($dir . base64_decode($file_name));
            if ($status == null) {
                return FALSE;
            } else {
                $assignment = DB::table('assignments_and_notes')->delete($id);
                if ($assignment) {
                    return $assignment;
                } else {
                    return FALSE;
                }
            }
        }


    }