//
//  SeedService.swift
//  RustQuiz
//
//  Created by Denis Denisov on 29/9/25.
//

import Foundation
import ComposableArchitecture

struct SeedService {
    var getTheBookSource: @Sendable () async throws -> Source
}

extension SeedService: DependencyKey {
    
    // MARK: - Live
    static let liveValue: SeedService = .init(
        getTheBookSource: {
            Source(
                id: UUID(),
                title: "the_book",
                priority: 1,
                quizzes: [
                    Quiz(
                        id: UUID(),
                        theme: "common_programming_concepts",
                        priority: 1,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "how_are_variables_declared_by_default_in_Rust",
                                answers: [
                                    Answer(id: UUID(),title: "mutable", isCorrect: false),
                                    Answer(id: UUID(),title: "immutable", isCorrect: true),
                                    Answer(id: UUID(),title: "dynamic", isCorrect: false),
                                    Answer(id: UUID(),title: "by_reference", isCorrect: false)
                                ],
                                descriptionText: "let_creates_an_immutable_binding_mutability_is_only_via_mut",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "to_make_a_variable_mutable_you_need",
                                answers: [
                                    Answer(id: UUID(),title: "var", isCorrect: false),
                                    Answer(id: UUID(),title: "mut", isCorrect: true),
                                    Answer(id: UUID(),title: "const", isCorrect: false),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "let_mut_x_this_is_the_only_syntax_to_allow_mutation.",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_let_x_5_x_10",
                                answers: [
                                    Answer(id: UUID(),title: "compilation_error_missing_semicolon", isCorrect: false),
                                    Answer(id: UUID(),title: "will_print_10", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error_assignment_to_immutable", isCorrect: true),
                                    Answer(id: UUID(),title: "automatically_becomes_mut", isCorrect: false)
                                ],
                                descriptionText: "rust_requires_explicit_mut_also_semicolon_after_5_needed",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_const_differ_from_let",
                                answers: [
                                    Answer(id: UUID(),title: "const_requires_explicit_type", isCorrect: true),
                                    Answer(id: UUID(),title: "const_only_inside_functions", isCorrect: false),
                                    Answer(id: UUID(),title: "const_can_be_made_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "let_evaluated_only_at_compile_time", isCorrect: false)
                                ],
                                descriptionText: "constants_always_have_explicit_type_and_constexpr_value",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "valid_constant_declaration",
                                answers: [
                                    Answer(id: UUID(),title: "const_pi_3_14", isCorrect: false),
                                    Answer(id: UUID(),title: "const_pi_f64_3_14", isCorrect: true),
                                    Answer(id: UUID(),title: "let_const_pi_f64_3_14", isCorrect: false),
                                    Answer(id: UUID(),title: "constant_pi_3_14", isCorrect: false)
                                ],
                                descriptionText: "type_after_colon_is_required_that_is_language_syntax",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_shadowing",
                                answers: [
                                    Answer(id: UUID(),title: "assignment_without_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "re_declaring_with_let_same_name", isCorrect: true),
                                    Answer(id: UUID(),title: "value_erasure", isCorrect: false),
                                    Answer(id: UUID(),title: "automatic_type_casting", isCorrect: false)
                                ],
                                descriptionText: "let_x_let_x_creates_a_new_binding",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_can_you_do_with_shadowing_but_not_mut",
                                answers: [
                                    Answer(id: UUID(),title: "change_type_with_same_name", isCorrect: true),
                                    Answer(id: UUID(),title: "change_value", isCorrect: false),
                                    Answer(id: UUID(),title: "use_in_loop", isCorrect: false),
                                    Answer(id: UUID(),title: "pass_to_function", isCorrect: false)
                                ],
                                descriptionText: "new_let_can_have_different_type_it_is_actually_new_variable",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_shadowing_example",
                                answers: [
                                    Answer(id: UUID(),title: "5", isCorrect: false),
                                    Answer(id: UUID(),title: "7", isCorrect: false),
                                    Answer(id: UUID(),title: "15", isCorrect: false),
                                    Answer(id: UUID(),title: "21", isCorrect: true)
                                ],
                                descriptionText: "7_to_21_each_line_creates_a_new_x",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_let_mut_s_hi_s_s_len",
                                answers: [
                                    Answer(id: UUID(),title: "type_error", isCorrect: true),
                                    Answer(id: UUID(),title: "becomes_2", isCorrect: false),
                                    Answer(id: UUID(),title: "becomes_2_string", isCorrect: false),
                                    Answer(id: UUID(),title: "panic", isCorrect: false)
                                ],
                                descriptionText: "static_str_to_usize_without_shadowing_is_invalid_mut_does_not_change_type",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "default_integer_type",
                                answers: [
                                    Answer(id: UUID(),title: "i32", isCorrect: true),
                                    Answer(id: UUID(),title: "i64", isCorrect: false),
                                    Answer(id: UUID(),title: "usize", isCorrect: false),
                                    Answer(id: UUID(),title: "depends", isCorrect: false)
                                ],
                                descriptionText: "default_is_i32",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "range_of_u8",
                                answers: [
                                    Answer(id: UUID(),title: "128_to_127", isCorrect: false),
                                    Answer(id: UUID(),title: "0_to_255", isCorrect: true),
                                    Answer(id: UUID(),title: "255_to_255", isCorrect: false),
                                    Answer(id: UUID(),title: "depends", isCorrect: false)
                                ],
                                descriptionText: "8_bits_unsigned",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_about_let_x_u8_256_debug",
                                answers: [
                                    Answer(id: UUID(),title: "becomes_0", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: true),
                                    Answer(id: UUID(),title: "runtime_panic", isCorrect: false),
                                    Answer(id: UUID(),title: "truncated_to_255", isCorrect: false)
                                ],
                                descriptionText: "constant_out_of_range_256_is_outside_u8_range",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "type_of_57u8",
                                answers: [
                                    Answer(id: UUID(),title: "i32", isCorrect: false),
                                    Answer(id: UUID(),title: "u32", isCorrect: false),
                                    Answer(id: UUID(),title: "u8", isCorrect: true),
                                    Answer(id: UUID(),title: "usize", isCorrect: false)
                                ],
                                descriptionText: "literal_suffix_sets_type",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_0b1111_0000_mean",
                                answers: [
                                    Answer(id: UUID(),title: "error", isCorrect: false),
                                    Answer(id: UUID(),title: "binary_literal", isCorrect: true),
                                    Answer(id: UUID(),title: "string", isCorrect: false),
                                    Answer(id: UUID(),title: "char", isCorrect: false)
                                ],
                                descriptionText: "underscores_allowed_for_readability",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "default_float_type",
                                answers: [
                                    Answer(id: UUID(),title: "f32", isCorrect: false),
                                    Answer(id: UUID(),title: "f64", isCorrect: true),
                                    Answer(id: UUID(),title: "decimal", isCorrect: false),
                                    Answer(id: UUID(),title: "depends", isCorrect: false)
                                ],
                                descriptionText: "more_precision_at_similar_cost",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "result_integers_5_divided_by_3",
                                answers: [
                                    Answer(id: UUID(),title: "2", isCorrect: false),
                                    Answer(id: UUID(),title: "1", isCorrect: true),
                                    Answer(id: UUID(),title: "0", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "division_rounds_toward_zero",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "boolean_literal",
                                answers: [
                                    Answer(id: UUID(),title: "true_string", isCorrect: false),
                                    Answer(id: UUID(),title: "True", isCorrect: false),
                                    Answer(id: UUID(),title: "false", isCorrect: true),
                                    Answer(id: UUID(),title: "1", isCorrect: false)
                                ],
                                descriptionText: "lowercase_not_a_string",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "char_in_rust",
                                answers: [
                                    Answer(id: UUID(),title: "1_byte_ascii", isCorrect: false),
                                    Answer(id: UUID(),title: "2_bytes_utf16", isCorrect: false),
                                    Answer(id: UUID(),title: "4_bytes_unicode_scalar", isCorrect: true),
                                    Answer(id: UUID(),title: "variable_length", isCorrect: false)
                                ],
                                descriptionText: "one_unicode_scalar",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_tuples",
                                answers: [
                                    Answer(id: UUID(),title: "fixed_length", isCorrect: false),
                                    Answer(id: UUID(),title: "different_types_allowed", isCorrect: false),
                                    Answer(id: UUID(),title: "indexed_by_dot_0", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "all_true",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_tuple_index",
                                answers: [
                                    Answer(id: UUID(),title: "1", isCorrect: false),
                                    Answer(id: UUID(),title: "2_0", isCorrect: true),
                                    Answer(id: UUID(),title: "c", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "index_1_to_second_element",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_i32_5_array",
                                answers: [
                                    Answer(id: UUID(),title: "only_i32", isCorrect: false),
                                    Answer(id: UUID(),title: "fixed_length", isCorrect: false),
                                    Answer(id: UUID(),title: "length_is_part_of_type", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "t_n",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_let_a_3_4_create",
                                answers: [
                                    Answer(id: UUID(),title: "3", isCorrect: false),
                                    Answer(id: UUID(),title: "3_3_3_3", isCorrect: true),
                                    Answer(id: UUID(),title: "4_4_4", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "repetition_syntax",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "accessing_a_10_when_length_is_5",
                                answers: [
                                    Answer(id: UUID(),title: "ub", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: false),
                                    Answer(id: UUID(),title: "runtime_panic", isCorrect: true),
                                    Answer(id: UUID(),title: "none", isCorrect: false)
                                ],
                                descriptionText: "bounds_checked_at_runtime",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "function_declaration",
                                answers: [
                                    Answer(id: UUID(),title: "func_name", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_name", isCorrect: true),
                                    Answer(id: UUID(),title: "function_name", isCorrect: false),
                                    Answer(id: UUID(),title: "def_name", isCorrect: false)
                                ],
                                descriptionText: "keyword_fn",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "function_parameters",
                                answers: [
                                    Answer(id: UUID(),title: "name_only", isCorrect: false),
                                    Answer(id: UUID(),title: "type_only", isCorrect: false),
                                    Answer(id: UUID(),title: "name_and_type", isCorrect: true),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "type_annotations_are_mandatory",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "default_return",
                                answers: [
                                    Answer(id: UUID(),title: "always_return", isCorrect: false),
                                    Answer(id: UUID(),title: "last_expression_without_semicolon", isCorrect: true),
                                    Answer(id: UUID(),title: "last_expression_with_semicolon", isCorrect: false),
                                    Answer(id: UUID(),title: "always_unit", isCorrect: false)
                                ],
                                descriptionText: "tail_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "if_you_put_semicolon_after_x_plus_1_in_function",
                                answers: [
                                    Answer(id: UUID(),title: "returns_x_plus_1", isCorrect: false),
                                    Answer(id: UUID(),title: "type_error_unit", isCorrect: true),
                                    Answer(id: UUID(),title: "auto_return", isCorrect: false),
                                    Answer(id: UUID(),title: "panic", isCorrect: false)
                                ],
                                descriptionText: "semicolon_turns_it_into_statement",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "statement_vs_expression",
                                answers: [
                                    Answer(id: UUID(),title: "statement_returns_value", isCorrect: false),
                                    Answer(id: UUID(),title: "expression_computes_value", isCorrect: true),
                                    Answer(id: UUID(),title: "both_return", isCorrect: false),
                                    Answer(id: UUID(),title: "no_difference", isCorrect: false)
                                ],
                                descriptionText: "rust_is_expression_oriented",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_let_x_let_y_6",
                                answers: [
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: true),
                                    Answer(id: UUID(),title: "x_and_y_are_6", isCorrect: false),
                                    Answer(id: UUID(),title: "panic", isCorrect: false),
                                    Answer(id: UUID(),title: "ub", isCorrect: false)
                                ],
                                descriptionText: "let_y_6_is_not_an_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "type_of_if_condition",
                                answers: [
                                    Answer(id: UUID(),title: "any_nonzero", isCorrect: false),
                                    Answer(id: UUID(),title: "only_bool", isCorrect: true),
                                    Answer(id: UUID(),title: "int_or_bool", isCorrect: false),
                                    Answer(id: UUID(),title: "any_scalar", isCorrect: false)
                                ],
                                descriptionText: "no_implicit_conversions",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_if_else_as_expression",
                                answers: [
                                    Answer(id: UUID(),title: "different_types_allowed", isCorrect: false),
                                    Answer(id: UUID(),title: "branch_types_must_match", isCorrect: false),
                                    Answer(id: UUID(),title: "else_is_optional", isCorrect: false),
                                    Answer(id: UUID(),title: "b_and_c", isCorrect: true)
                                ],
                                descriptionText: "if_is_expression_else_is_optional",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_if_expression",
                                answers: [
                                    Answer(id: UUID(),title: "1", isCorrect: true),
                                    Answer(id: UUID(),title: "2", isCorrect: false),
                                    Answer(id: UUID(),title: "true", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "took_the_value_of_true_branch",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "infinite_loop_until_break",
                                answers: [
                                    Answer(id: UUID(),title: "loop", isCorrect: true),
                                    Answer(id: UUID(),title: "while", isCorrect: false),
                                    Answer(id: UUID(),title: "for", isCorrect: false),
                                    Answer(id: UUID(),title: "repeat", isCorrect: false)
                                ],
                                descriptionText: "loop_has_no_condition",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "break_value_in_loop",
                                answers: [
                                    Answer(id: UUID(),title: "skip_iteration", isCorrect: false),
                                    Answer(id: UUID(),title: "exit_loop_and_return_value", isCorrect: true),
                                    Answer(id: UUID(),title: "error", isCorrect: false),
                                    Answer(id: UUID(),title: "return_unit", isCorrect: false)
                                ],
                                descriptionText: "loop_is_an_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "loop_labels_label",
                                answers: [
                                    Answer(id: UUID(),title: "comments", isCorrect: false),
                                    Answer(id: UUID(),title: "target_for_break_continue", isCorrect: true),
                                    Answer(id: UUID(),title: "optimization", isCorrect: false),
                                    Answer(id: UUID(),title: "counter", isCorrect: false)
                                ],
                                descriptionText: "eg_break_outer",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_while",
                                answers: [
                                    Answer(id: UUID(),title: "while_condition_is_true", isCorrect: false),
                                    Answer(id: UUID(),title: "can_be_infinite", isCorrect: false),
                                    Answer(id: UUID(),title: "condition_is_bool", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "depends_on_condition",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_for",
                                answers: [
                                    Answer(id: UUID(),title: "iterates_into_iterator", isCorrect: false),
                                    Answer(id: UUID(),title: "works_with_ranges", isCorrect: false),
                                    Answer(id: UUID(),title: "safer_than_manual_indexing", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "idiomatic_iteration",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "countdown_3_to_1",
                                answers: [
                                    Answer(id: UUID(),title: "for_n_in_1_to_3_rev", isCorrect: true),
                                    Answer(id: UUID(),title: "for_n_in_3_to_1_rev", isCorrect: false),
                                    Answer(id: UUID(),title: "for_n_in_1_to_3", isCorrect: false),
                                    Answer(id: UUID(),title: "for_n_in_0_to_3_rev", isCorrect: false)
                                ],
                                descriptionText: "1_to_3_gives_1_to_3_rev_gives_3_to_1",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "comments",
                                answers: [
                                    Answer(id: UUID(),title: "hash", isCorrect: false),
                                    Answer(id: UUID(),title: "double_slash", isCorrect: false),
                                    Answer(id: UUID(),title: "slash_star_star_slash", isCorrect: false),
                                    Answer(id: UUID(),title: "b_and_c", isCorrect: true)
                                ],
                                descriptionText: "rust_supports_both",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "valid_comment",
                                answers: [
                                    Answer(id: UUID(),title: "this_is_comment", isCorrect: true),
                                    Answer(id: UUID(),title: "dash_this_is_comment", isCorrect: false),
                                    Answer(id: UUID(),title: "percent_percent_this_is_comment", isCorrect: false),
                                    Answer(id: UUID(),title: "hash_this_is_comment", isCorrect: false)
                                ],
                                descriptionText: "hash_is_not_for_comments_used_for_attributes",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_usize",
                                answers: [
                                    Answer(id: UUID(),title: "size_depends_on_architecture", isCorrect: false),
                                    Answer(id: UUID(),title: "used_for_indices_sizes", isCorrect: false),
                                    Answer(id: UUID(),title: "unsigned", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "platform_dependent_index_type",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "tuple_of_three_elements",
                                answers: [
                                    Answer(id: UUID(),title: "1_a_true", isCorrect: true),
                                    Answer(id: UUID(),title: "1_a_true_braces", isCorrect: false),
                                    Answer(id: UUID(),title: "1_a_true_brackets", isCorrect: false),
                                    Answer(id: UUID(),title: "1_a_true_angle", isCorrect: false)
                                ],
                                descriptionText: "parentheses_to_tuple",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_b_A_mean",
                                answers: [
                                    Answer(id: UUID(),title: "char_A", isCorrect: false),
                                    Answer(id: UUID(),title: "u8_with_ascii_value", isCorrect: true),
                                    Answer(id: UUID(),title: "A_string", isCorrect: false),
                                    Answer(id: UUID(),title: "bool", isCorrect: false)
                                ],
                                descriptionText: "prefix_b_to_byte_literal",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "range_of_i16",
                                answers: [
                                    Answer(id: UUID(),title: "32768_to_32767", isCorrect: true),
                                    Answer(id: UUID(),title: "65536_to_65535", isCorrect: false),
                                    Answer(id: UUID(),title: "0_to_32767", isCorrect: false),
                                    Answer(id: UUID(),title: "0_to_65535", isCorrect: false)
                                ],
                                descriptionText: "16_bit_signed",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "unit_type",
                                answers: [
                                    Answer(id: UUID(),title: "empty_value", isCorrect: false),
                                    Answer(id: UUID(),title: "empty_tuple", isCorrect: false),
                                    Answer(id: UUID(),title: "functions_without_return_type_return_it", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "all_properties_of_unit",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "valid_function_with_parameter",
                                answers: [
                                    Answer(id: UUID(),title: "fn_f_x", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_f_x_i32", isCorrect: true),
                                    Answer(id: UUID(),title: "fn_f_i32_x", isCorrect: false),
                                    Answer(id: UUID(),title: "function_f_x_i32", isCorrect: false)
                                ],
                                descriptionText: "type_required_after_colon",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_block_expression",
                                answers: [
                                    Answer(id: UUID(),title: "2", isCorrect: false),
                                    Answer(id: UUID(),title: "3", isCorrect: false),
                                    Answer(id: UUID(),title: "5", isCorrect: true),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "block_is_an_expression_returns_y_plus_3",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_if_false_10_else_ten",
                                answers: [
                                    Answer(id: UUID(),title: "becomes_string", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error_different_branch_types", isCorrect: true),
                                    Answer(id: UUID(),title: "becomes_option", isCorrect: false),
                                    Answer(id: UUID(),title: "panic", isCorrect: false)
                                ],
                                descriptionText: "if_expression_must_have_single_type",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_to_exit_infinite_loop_properly",
                                answers: [
                                    Answer(id: UUID(),title: "break", isCorrect: false),
                                    Answer(id: UUID(),title: "return", isCorrect: false),
                                    Answer(id: UUID(),title: "exit", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above_possible", isCorrect: true)
                                ],
                                descriptionText: "all_terminate_loop_function_process_but_idiomatic_is_break",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_keywords",
                                answers: [
                                    Answer(id: UUID(),title: "can_be_used_as_names", isCorrect: false),
                                    Answer(id: UUID(),title: "reserved", isCorrect: true),
                                    Answer(id: UUID(),title: "ignored", isCorrect: false),
                                    Answer(id: UUID(),title: "usable_with_at", isCorrect: false)
                                ],
                                descriptionText: "see_appendix_a",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_about_let_guess_u32_42_parse_unwrap",
                                answers: [
                                    Answer(id: UUID(),title: "string", isCorrect: false),
                                    Answer(id: UUID(),title: "u32_equals_42", isCorrect: true),
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: false),
                                    Answer(id: UUID(),title: "bool", isCorrect: false)
                                ],
                                descriptionText: "type_annotation_directs_parse",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_len_do_on_i32_5",
                                answers: [
                                    Answer(id: UUID(),title: "5", isCorrect: true),
                                    Answer(id: UUID(),title: "last_element", isCorrect: false),
                                    Answer(id: UUID(),title: "option", isCorrect: false),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "array_length",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "overflow_of_u8_in_release",
                                answers: [
                                    Answer(id: UUID(),title: "panic", isCorrect: false),
                                    Answer(id: UUID(),title: "compilation_error", isCorrect: false),
                                    Answer(id: UUID(),title: "wrapping", isCorrect: true),
                                    Answer(id: UUID(),title: "auto_type_promotion", isCorrect: false)
                                ],
                                descriptionText: "two_complement_wrapping",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "modulo_operator",
                                answers: [
                                    Answer(id: UUID(),title: "mod", isCorrect: false),
                                    Answer(id: UUID(),title: "percent", isCorrect: true),
                                    Answer(id: UUID(),title: "rem", isCorrect: false),
                                    Answer(id: UUID(),title: "div", isCorrect: false)
                                ],
                                descriptionText: "standard_syntax",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "function_with_return_value",
                                answers: [
                                    Answer(id: UUID(),title: "fn_f_return_5", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_f_i32_5", isCorrect: true),
                                    Answer(id: UUID(),title: "fn_f_i32_5_arrow", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_f_equals_5", isCorrect: false)
                                ],
                                descriptionText: "arrow_type_plus_tail_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_for_in_rust",
                                answers: [
                                    Answer(id: UUID(),title: "can_iterate_chars_of_string", isCorrect: false),
                                    Answer(id: UUID(),title: "can_iterate_ranges", isCorrect: false),
                                    Answer(id: UUID(),title: "safer_than_manual_indexing", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "works_with_any_into_iterator",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "hex_literal",
                                answers: [
                                    Answer(id: UUID(),title: "0xFF", isCorrect: true),
                                    Answer(id: UUID(),title: "FF", isCorrect: false),
                                    Answer(id: UUID(),title: "xFF", isCorrect: false),
                                    Answer(id: UUID(),title: "xFF", isCorrect: false)
                                ],
                                descriptionText: "0x_is_valid_prefix",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_this_print_months_array",
                                answers: [
                                    Answer(id: UUID(),title: "Jan", isCorrect: false),
                                    Answer(id: UUID(),title: "Feb", isCorrect: false),
                                    Answer(id: UUID(),title: "Mar", isCorrect: true),
                                    Answer(id: UUID(),title: "error", isCorrect: false)
                                ],
                                descriptionText: "index_2",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_continue",
                                answers: [
                                    Answer(id: UUID(),title: "breaks_whole_loop", isCorrect: false),
                                    Answer(id: UUID(),title: "skips_current_iteration", isCorrect: true),
                                    Answer(id: UUID(),title: "panic", isCorrect: false),
                                    Answer(id: UUID(),title: "only_in_while", isCorrect: false)
                                ],
                                descriptionText: "moves_to_next_iteration",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_rev",
                                answers: [
                                    Answer(id: UUID(),title: "applies_to_ranges", isCorrect: false),
                                    Answer(id: UUID(),title: "reverses_iteration_order", isCorrect: false),
                                    Answer(id: UUID(),title: "works_with_for", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "it_is_an_iterator_adapter",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "explicit_type_for_variable",
                                answers: [
                                    Answer(id: UUID(),title: "let_x_5", isCorrect: false),
                                    Answer(id: UUID(),title: "let_x_i32_5", isCorrect: true),
                                    Answer(id: UUID(),title: "var_x_i32_5", isCorrect: false),
                                    Answer(id: UUID(),title: "def_x_i32_5", isCorrect: false)
                                ],
                                descriptionText: "let_name_type_equals_expr",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "function_naming_style",
                                answers: [
                                    Answer(id: UUID(),title: "camelCase", isCorrect: false),
                                    Answer(id: UUID(),title: "snake_case", isCorrect: true),
                                    Answer(id: UUID(),title: "PascalCase", isCorrect: false),
                                    Answer(id: UUID(),title: "kebab_case", isCorrect: false)
                                ],
                                descriptionText: "idiomatic_rust_style",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_plus_function",
                                answers: [
                                    Answer(id: UUID(),title: "4", isCorrect: false),
                                    Answer(id: UUID(),title: "5", isCorrect: true),
                                    Answer(id: UUID(),title: "error", isCorrect: false),
                                    Answer(id: UUID(),title: "unit", isCorrect: false)
                                ],
                                descriptionText: "returns_5_as_tail_expression",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "about_comments",
                                answers: [
                                    Answer(id: UUID(),title: "single_line", isCorrect: false),
                                    Answer(id: UUID(),title: "multi_line_including_nested", isCorrect: false),
                                    Answer(id: UUID(),title: "ignored_by_compiler", isCorrect: false),
                                    Answer(id: UUID(),title: "all_of_above", isCorrect: true)
                                ],
                                descriptionText: "both_syntaxes_valid_block_comments_nest",
                                descriptionLink: "common_programming_concepts_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "result_of_43_modulo_5",
                                answers: [
                                    Answer(id: UUID(),title: "3", isCorrect: true),
                                    Answer(id: UUID(),title: "4", isCorrect: false),
                                    Answer(id: UUID(),title: "5", isCorrect: false),
                                    Answer(id: UUID(),title: "8", isCorrect: false)
                                ],
                                descriptionText: "43_equals_5_times_8_plus_3",
                                descriptionLink: "common_programming_concepts_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "understanding_ownership",
                        priority: 2,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "what_is_ownership_in_Rust",
                                answers: [
                                    Answer(id: UUID(),title: "background_GC", isCorrect: false),
                                    Answer(id: UUID(),title: "a_set_of_compiler_checked_rules_for_memory_management", isCorrect: true),
                                    Answer(id: UUID(),title: "manual_freeing_via_free", isCorrect: false),
                                    Answer(id: UUID(),title: "a_compile_time_optimization", isCorrect: false)
                                ],
                                descriptionText: "ownership_is_rules_the_compiler_checks_it_provides_safety_without_a_GC",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "which_rule_about_values_owner_is_true",
                                answers: [
                                    Answer(id: UUID(),title: "a_value_can_have_many_owners", isCorrect: false),
                                    Answer(id: UUID(),title: "a_value_may_have_no_owner", isCorrect: false),
                                    Answer(id: UUID(),title: "at_any_moment_there_is_exactly_one_owner", isCorrect: true),
                                    Answer(id: UUID(),title: "owners_exist_only_for_heap_data", isCorrect: false)
                                ],
                                descriptionText: "one_owner_at_a_time_prevents_double_drop",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_when_owner_goes_out_of_scope",
                                answers: [
                                    Answer(id: UUID(),title: "nothing", isCorrect: false),
                                    Answer(id: UUID(),title: "memory_leaks", isCorrect: false),
                                    Answer(id: UUID(),title: "drop_is_called_and_resource_is_released", isCorrect: true),
                                    Answer(id: UUID(),title: "the_value_becomes_static", isCorrect: false)
                                ],
                                descriptionText: "automatic_drop_rust_uses_raii",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "where_do_fixed_size_types_live_entirely",
                                answers: [
                                    Answer(id: UUID(),title: "on_the_heap", isCorrect: false),
                                    Answer(id: UUID(),title: "on_the_stack", isCorrect: true),
                                    Answer(id: UUID(),title: "always_in_static_memory", isCorrect: false),
                                    Answer(id: UUID(),title: "in_the_binary_file", isCorrect: false)
                                ],
                                descriptionText: "scalars_are_on_stack_size_known_at_compile_time",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_str_differ_from_string",
                                answers: [
                                    Answer(id: UUID(),title: "no_difference", isCorrect: false),
                                    Answer(id: UUID(),title: "str_is_immutable_slice_string_owns_and_mutably_manages_heap_data", isCorrect: true),
                                    Answer(id: UUID(),title: "str_is_always_on_heap", isCorrect: false),
                                    Answer(id: UUID(),title: "string_is_always_on_stack", isCorrect: false)
                                ],
                                descriptionText: "str_is_slice_string_is_owning_buffer_different_memory_models",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_string_move_example",
                                answers: [
                                    Answer(id: UUID(),title: "prints_hi", isCorrect: false),
                                    Answer(id: UUID(),title: "compile_error_use_of_moved_value", isCorrect: true),
                                    Answer(id: UUID(),title: "runtime_panic", isCorrect: false),
                                    Answer(id: UUID(),title: "s1_is_automatically_cloned", isCorrect: false)
                                ],
                                descriptionText: "s1_was_moved_string_is_not_copy",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_name_of_ownership_transfer_in_let_s2_s1",
                                answers: [
                                    Answer(id: UUID(),title: "borrowing", isCorrect: false),
                                    Answer(id: UUID(),title: "moving", isCorrect: true),
                                    Answer(id: UUID(),title: "cloning", isCorrect: false),
                                    Answer(id: UUID(),title: "aliasing", isCorrect: false)
                                ],
                                descriptionText: "that_is_move_ownership_is_transferred_to_new_name",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_copied_in_let_s2_s1_for_string",
                                answers: [
                                    Answer(id: UUID(),title: "heap_data", isCorrect: false),
                                    Answer(id: UUID(),title: "only_the_length", isCorrect: false),
                                    Answer(id: UUID(),title: "pointer_length_and_capacity_stack_part", isCorrect: true),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "stack_metadata_no_deep_copy_is_performed",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_does_rust_invalidate_old_variable_after_move",
                                answers: [
                                    Answer(id: UUID(),title: "to_speed_up_compilation", isCorrect: false),
                                    Answer(id: UUID(),title: "to_avoid_double_free", isCorrect: true),
                                    Answer(id: UUID(),title: "to_make_debugging_easier", isCorrect: false),
                                    Answer(id: UUID(),title: "to_speed_up_memory_access", isCorrect: false)
                                ],
                                descriptionText: "no_two_owners_of_one_buffer_memory_safety",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_clone_do_for_string",
                                answers: [
                                    Answer(id: UUID(),title: "copies_only_the_pointer", isCorrect: false),
                                    Answer(id: UUID(),title: "moves_ownership", isCorrect: false),
                                    Answer(id: UUID(),title: "performs_deep_copy_of_heap_data", isCorrect: true),
                                    Answer(id: UUID(),title: "frees_the_original", isCorrect: false)
                                ],
                                descriptionText: "deep_copy_duplicates_the_bytes",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "which_types_typically_implement_copy",
                                answers: [
                                    Answer(id: UUID(),title: "all_heap_types", isCorrect: false),
                                    Answer(id: UUID(),title: "scalars_and_tuples_composed_entirely_of_copy_types", isCorrect: true),
                                    Answer(id: UUID(),title: "only_string", isCorrect: false),
                                    Answer(id: UUID(),title: "any_structs", isCorrect: false)
                                ],
                                descriptionText: "simple_stack_types_copying_is_trivial",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_isnt_string_copy",
                                answers: [
                                    Answer(id: UUID(),title: "it_is_str", isCorrect: false),
                                    Answer(id: UUID(),title: "it_manages_heap_resource_drop", isCorrect: true),
                                    Answer(id: UUID(),title: "it_is_too_long", isCorrect: false),
                                    Answer(id: UUID(),title: "it_requires_static", isCorrect: false)
                                ],
                                descriptionText: "has_resource_and_drop_copying_would_be_unsafe",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "passing_arguments_to_function_by_value",
                                answers: [
                                    Answer(id: UUID(),title: "is_always_deep_copy", isCorrect: false),
                                    Answer(id: UUID(),title: "behaves_like_assignment_move_or_copy", isCorrect: true),
                                    Answer(id: UUID(),title: "is_always_by_reference", isCorrect: false),
                                    Answer(id: UUID(),title: "never_moves", isCorrect: false)
                                ],
                                descriptionText: "same_rules_unified_ownership_model",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "which_is_true_function_takes_string",
                                answers: [
                                    Answer(id: UUID(),title: "x_is_available", isCorrect: false),
                                    Answer(id: UUID(),title: "x_is_unavailable_moved", isCorrect: true),
                                    Answer(id: UUID(),title: "x_is_copy", isCorrect: false),
                                    Answer(id: UUID(),title: "there_will_be_panic", isCorrect: false)
                                ],
                                descriptionText: "move_into_function_string_passed_by_ownership",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_to_return_value_without_return",
                                answers: [
                                    Answer(id: UUID(),title: "you_cant", isCorrect: false),
                                    Answer(id: UUID(),title: "make_it_last_expression_without_semicolon", isCorrect: true),
                                    Answer(id: UUID(),title: "use_yield", isCorrect: false),
                                    Answer(id: UUID(),title: "use_give_back", isCorrect: false)
                                ],
                                descriptionText: "tail_expression_expressions_return_values",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_use_references_t",
                                answers: [
                                    Answer(id: UUID(),title: "to_speed_up_compilation", isCorrect: false),
                                    Answer(id: UUID(),title: "to_temporarily_borrow_value_without_transferring_ownership", isCorrect: true),
                                    Answer(id: UUID(),title: "for_deep_copy", isCorrect: false),
                                    Answer(id: UUID(),title: "to_make_it_static", isCorrect: false)
                                ],
                                descriptionText: "use_without_move_borrowing",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_true_about_string_reference",
                                answers: [
                                    Answer(id: UUID(),title: "allows_modifying_string", isCorrect: false),
                                    Answer(id: UUID(),title: "immutable_reference_read_without_owning", isCorrect: true),
                                    Answer(id: UUID(),title: "extends_owners_lifetime", isCorrect: false),
                                    Answer(id: UUID(),title: "calls_drop_on_owner", isCorrect: false)
                                ],
                                descriptionText: "read_only_need_mut_for_mutation",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_to_allow_modifying_borrowed_string",
                                answers: [
                                    Answer(id: UUID(),title: "accept_mut_string_and_pass_mut_s", isCorrect: true),
                                    Answer(id: UUID(),title: "accept_string", isCorrect: false),
                                    Answer(id: UUID(),title: "accept_string", isCorrect: false),
                                    Answer(id: UUID(),title: "accept_box_string", isCorrect: false)
                                ],
                                descriptionText: "need_mutable_reference_explicit_write_permission",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "constraint_on_references",
                                answers: [
                                    Answer(id: UUID(),title: "many_mut_at_same_time_are_allowed", isCorrect: false),
                                    Answer(id: UUID(),title: "either_one_mut_or_any_number_of_but_not_both_simultaneously", isCorrect: true),
                                    Answer(id: UUID(),title: "one_mut_and_one_are_allowed_together", isCorrect: false),
                                    Answer(id: UUID(),title: "no_constraints", isCorrect: false)
                                ],
                                descriptionText: "anti_data_race_rule_prevents_races",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_with_simultaneous_and_mut_to_same_object",
                                answers: [
                                    Answer(id: UUID(),title: "compiles", isCorrect: false),
                                    Answer(id: UUID(),title: "compile_error_e0502", isCorrect: true),
                                    Answer(id: UUID(),title: "runtime_panic", isCorrect: false),
                                    Answer(id: UUID(),title: "ub", isCorrect: false)
                                ],
                                descriptionText: "borrowing_conflict_violates_rules",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "when_does_reference_lifetime_end_in_simple_cases_nll",
                                answers: [
                                    Answer(id: UUID(),title: "always_at_end_of_block", isCorrect: false),
                                    Answer(id: UUID(),title: "when_owner_is_dropped", isCorrect: false),
                                    Answer(id: UUID(),title: "after_its_last_use", isCorrect: true),
                                    Answer(id: UUID(),title: "never", isCorrect: false)
                                ],
                                descriptionText: "non_lexical_lifetimes_shorten_it_safer_and_more_flexible",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_dangling_reference",
                                answers: [
                                    Answer(id: UUID(),title: "reference_to_another_type", isCorrect: false),
                                    Answer(id: UUID(),title: "reference_to_already_freed_memory", isCorrect: true),
                                    Answer(id: UUID(),title: "reference_always_on_stack", isCorrect: false),
                                    Answer(id: UUID(),title: "reference_to_empty_array", isCorrect: false)
                                ],
                                descriptionText: "dangling_reference_object_already_dropped",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_doesnt_dangle_function_compile",
                                answers: [
                                    Answer(id: UUID(),title: "you_cant_return_references", isCorrect: false),
                                    Answer(id: UUID(),title: "s_will_be_dropped_reference_becomes_invalid", isCorrect: true),
                                    Answer(id: UUID(),title: "you_cant_allocate_in_function", isCorrect: false),
                                    Answer(id: UUID(),title: "you_need_gc", isCorrect: false)
                                ],
                                descriptionText: "returning_reference_to_local_dangling_references_are_forbidden",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_to_fix_dangle",
                                answers: [
                                    Answer(id: UUID(),title: "return_string_by_ownership", isCorrect: true),
                                    Answer(id: UUID(),title: "always_return_static_string", isCorrect: false),
                                    Answer(id: UUID(),title: "return_string", isCorrect: false),
                                    Answer(id: UUID(),title: "use_unsafe", isCorrect: false)
                                ],
                                descriptionText: "move_value_out_owner_lives_outside",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_slice_str_t",
                                answers: [
                                    Answer(id: UUID(),title: "ownership_of_part_of_collection", isCorrect: false),
                                    Answer(id: UUID(),title: "non_owning_reference_to_contiguous_region_of_data", isCorrect: true),
                                    Answer(id: UUID(),title: "copied_range", isCorrect: false),
                                    Answer(id: UUID(),title: "smart_pointer_with_auto_drop", isCorrect: false)
                                ],
                                descriptionText: "slice_equals_pointer_plus_length_no_ownership",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_is_returning_usize_index_from_first_word_risky",
                                answers: [
                                    Answer(id: UUID(),title: "index_can_be_negative", isCorrect: false),
                                    Answer(id: UUID(),title: "index_isnt_tied_to_data_and_becomes_stale_after_modifications", isCorrect: true),
                                    Answer(id: UUID(),title: "usize_is_too_small", isCorrect: false),
                                    Answer(id: UUID(),title: "you_cant_compute_string_length", isCorrect: false)
                                ],
                                descriptionText: "detached_index_breaks_after_clear_no_coupling_to_data",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "which_signature_is_more_general_first_word",
                                answers: [
                                    Answer(id: UUID(),title: "fn_first_word_s_string_str", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_first_word_s_str_str", isCorrect: true),
                                    Answer(id: UUID(),title: "fn_first_word_s_string_str", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_first_word_t_s_t_str", isCorrect: false)
                                ],
                                descriptionText: "works_with_string_and_literals_more_general_slice",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_slice_s_3_7_of_string_store",
                                answers: [
                                    Answer(id: UUID(),title: "copy_of_bytes", isCorrect: false),
                                    Answer(id: UUID(),title: "pointer_to_start_and_length", isCorrect: true),
                                    Answer(id: UUID(),title: "new_string", isCorrect: false),
                                    Answer(id: UUID(),title: "static_data", isCorrect: false)
                                ],
                                descriptionText: "pointer_plus_len_no_copying",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_slice_bounds_are_valid_for_string",
                                answers: [
                                    Answer(id: UUID(),title: "any_byte_offsets", isCorrect: false),
                                    Answer(id: UUID(),title: "only_at_valid_utf8_boundaries", isCorrect: true),
                                    Answer(id: UUID(),title: "only_on_unicode_grapheme_boundaries", isCorrect: false),
                                    Answer(id: UUID(),title: "only_multiples_of_4", isCorrect: false)
                                ],
                                descriptionText: "by_unicode_scalar_boundaries_otherwise_runtime_error",
                                descriptionLink: "understanding_ownership_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_will_happen_string_clear_borrow_conflict",
                                answers: [
                                    Answer(id: UUID(),title: "prints_empty", isCorrect: false),
                                    Answer(id: UUID(),title: "compiles_and_crashes", isCorrect: false),
                                    Answer(id: UUID(),title: "compile_error_borrow_conflict", isCorrect: true),
                                    Answer(id: UUID(),title: "its_fine_w_isnt_tied_to_s", isCorrect: false)
                                ],
                                descriptionText: "cannot_have_and_mut_simultaneously_clear_needs_mut_while_w_is_alive",
                                descriptionLink: "understanding_ownership_link"
                            )
                        ]
                    ),
                    Quiz(
                        id: UUID(),
                        theme: "using_structs_to_structure_related_data",
                        priority: 3,
                        questions: [
                            Question(
                                id: UUID(),
                                title: "how_is_a_struct_defined_in_Rust",
                                answers: [
                                    Answer(id: UUID(),title: "class_user_{ … }", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_user_{ … }", isCorrect: true),
                                    Answer(id: UUID(),title: "object_user_{ … }", isCorrect: false),
                                    Answer(id: UUID(),title: "data_user_{ … }", isCorrect: false)
                                ],
                                descriptionText: "use_the_struct_keyword_with_braces_Rust_has_no_Java_Kotlin_style_class_or_object",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_are_fields_in_a_struct",
                                answers: [
                                    Answer(id: UUID(),title: "default_values", isCorrect: false),
                                    Answer(id: UUID(),title: "variables_inside_a_function", isCorrect: false),
                                    Answer(id: UUID(),title: "named_data_inside_a_struct", isCorrect: true),
                                    Answer(id: UUID(),title: "separate_methods_of_the_struct", isCorrect: false)
                                ],
                                descriptionText: "fields_are_the_components_of_a_struct_each_with_its_own_name_and_type",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_must_be_specified_when_declaring_a_field",
                                answers: [
                                    Answer(id: UUID(),title: "only_the_name", isCorrect: false),
                                    Answer(id: UUID(),title: "only_the_type", isCorrect: false),
                                    Answer(id: UUID(),title: "name_and_type", isCorrect: true),
                                    Answer(id: UUID(),title: "nothing_Rust_infers_it", isCorrect: false)
                                ],
                                descriptionText: "struct_fields_always_specify_both_name_and_type",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_create_a_struct_instance",
                                answers: [
                                    Answer(id: UUID(),title: "User_true_name_email_1", isCorrect: false),
                                    Answer(id: UUID(),title: "User_active_true_username_email_sign_in_count_1", isCorrect: true),
                                    Answer(id: UUID(),title: "new_User", isCorrect: false),
                                    Answer(id: UUID(),title: "User_new_always", isCorrect: false)
                                ],
                                descriptionText: "a_struct_instance_is_created_with_key_value",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "can_you_change_the_fields_of_a_struct_instance",
                                answers: [
                                    Answer(id: UUID(),title: "always", isCorrect: false),
                                    Answer(id: UUID(),title: "only_if_the_field_itself_is_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "only_if_the_binding_the_whole_variable_is_mut", isCorrect: true),
                                    Answer(id: UUID(),title: "never", isCorrect: false)
                                ],
                                descriptionText: "in_Rust_mutability_is_set_for_the_whole_instance",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_access_a_struct_field",
                                answers: [
                                    Answer(id: UUID(),title: "user_email", isCorrect: false),
                                    Answer(id: UUID(),title: "user_email", isCorrect: false),
                                    Answer(id: UUID(),title: "user_email", isCorrect: true),
                                    Answer(id: UUID(),title: "email_user", isCorrect: false)
                                ],
                                descriptionText: "use_dot_notation",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_field_init_shorthand_do",
                                answers: [
                                    Answer(id: UUID(),title: "automatically_creates_getters", isCorrect: false),
                                    Answer(id: UUID(),title: "lets_you_omit_the_field_name_if_it_matches_the_parameter_name", isCorrect: true),
                                    Answer(id: UUID(),title: "automatically_makes_all_fields_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "duplicates_all_fields", isCorrect: false)
                                ],
                                descriptionText: "if_a_parameter_and_field_share_a_name_you_can_write_it_once",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_the_shorthand_call_look_like",
                                answers: [
                                    Answer(id: UUID(),title: "User_email_email_username_username", isCorrect: false),
                                    Answer(id: UUID(),title: "User_email_username", isCorrect: true),
                                    Answer(id: UUID(),title: "User_email_username", isCorrect: false),
                                    Answer(id: UUID(),title: "User_from_email_username", isCorrect: false)
                                ],
                                descriptionText: "Rust_expands_email_to_email_email",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_the_struct_update_syntax_do",
                                answers: [
                                    Answer(id: UUID(),title: "clones_a_struct", isCorrect: false),
                                    Answer(id: UUID(),title: "creates_a_new_instance_by_changing_some_fields_and_copying_the_rest_from_another_instance", isCorrect: true),
                                    Answer(id: UUID(),title: "mutates_the_struct_in_place", isCorrect: false),
                                    Answer(id: UUID(),title: "deletes_fields", isCorrect: false)
                                ],
                                descriptionText: "use_other_struct",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_is_the_update_syntax_written",
                                answers: [
                                    Answer(id: UUID(),title: "User_email_x_user1", isCorrect: false),
                                    Answer(id: UUID(),title: "User_email_x_user1", isCorrect: true),
                                    Answer(id: UUID(),title: "User_update_user1_x", isCorrect: false),
                                    Answer(id: UUID(),title: "User_user1_email_x", isCorrect: false)
                                ],
                                descriptionText: "user1_copies_the_remaining_fields",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_to_user1_username_when_using_user1",
                                answers: [
                                    Answer(id: UUID(),title: "its_cloned", isCorrect: false),
                                    Answer(id: UUID(),title: "its_moved", isCorrect: true),
                                    Answer(id: UUID(),title: "it_remains_accessible", isCorrect: false),
                                    Answer(id: UUID(),title: "its_always_copied_even_if_its_a_String", isCorrect: false)
                                ],
                                descriptionText: "String_fields_are_moved",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_to_user1_active_if_its_a_bool",
                                answers: [
                                    Answer(id: UUID(),title: "its_moved", isCorrect: false),
                                    Answer(id: UUID(),title: "its_copied", isCorrect: true),
                                    Answer(id: UUID(),title: "compile_error", isCorrect: false),
                                    Answer(id: UUID(),title: "dropped", isCorrect: false)
                                ],
                                descriptionText: "bool_implements_Copy",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_a_tuple_struct",
                                answers: [
                                    Answer(id: UUID(),title: "a_struct_without_fields", isCorrect: false),
                                    Answer(id: UUID(),title: "a_struct_with_a_name_but_without_field_names", isCorrect: true),
                                    Answer(id: UUID(),title: "a_struct_of_only_bools", isCorrect: false),
                                    Answer(id: UUID(),title: "a_struct_with_dynamic_fields", isCorrect: false)
                                ],
                                descriptionText: "fields_are_specified_only_by_types",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_declare_a_tuple_struct",
                                answers: [
                                    Answer(id: UUID(),title: "struct_Color_i32_i32_i32", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_Color_i32_i32_i32", isCorrect: true),
                                    Answer(id: UUID(),title: "tuple_Color_i32_i32_i32", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_Color_i32_i32_i32", isCorrect: false)
                                ],
                                descriptionText: "provide_the_name_and_types_in_parentheses",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_Color_and_Point_differ",
                                answers: [
                                    Answer(id: UUID(),title: "no_difference_theyre_aliases", isCorrect: false),
                                    Answer(id: UUID(),title: "theyre_different_types_even_if_they_have_identical_fields", isCorrect: true),
                                    Answer(id: UUID(),title: "the_only_difference_is_variable_names", isCorrect: false),
                                    Answer(id: UUID(),title: "Point_can_be_used_in_place_of_Color", isCorrect: false)
                                ],
                                descriptionText: "each_struct_is_a_distinct_type",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_a_unit_like_struct",
                                answers: [
                                    Answer(id: UUID(),title: "a_struct_with_one_field", isCorrect: false),
                                    Answer(id: UUID(),title: "a_struct_with_no_fields", isCorrect: true),
                                    Answer(id: UUID(),title: "a_struct_with_str", isCorrect: false),
                                    Answer(id: UUID(),title: "a_struct_thats_always_mut", isCorrect: false)
                                ],
                                descriptionText: "written_as_struct_Name",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_are_unit_like_structs_used_for",
                                answers: [
                                    Answer(id: UUID(),title: "storing_an_empty_string", isCorrect: false),
                                    Answer(id: UUID(),title: "implementing_traits_without_storing_data", isCorrect: true),
                                    Answer(id: UUID(),title: "saving_memory", isCorrect: false),
                                    Answer(id: UUID(),title: "replacing_enums", isCorrect: false)
                                ],
                                descriptionText: "used_for_behavior_not_data",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_do_structs_usually_use_String_instead_of_str",
                                answers: [
                                    Answer(id: UUID(),title: "String_is_faster", isCorrect: false),
                                    Answer(id: UUID(),title: "String_is_always_smaller_in_memory", isCorrect: false),
                                    Answer(id: UUID(),title: "so_the_struct_owns_its_data", isCorrect: true),
                                    Answer(id: UUID(),title: "to_avoid_writing_lifetimes", isCorrect: false)
                                ],
                                descriptionText: "String_owns_data_str_requires_a_lifetime",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_if_you_put_str_in_a_struct_without_a_lifetime",
                                answers: [
                                    Answer(id: UUID(),title: "compiles", isCorrect: false),
                                    Answer(id: UUID(),title: "error_missing_lifetime_specifier", isCorrect: true),
                                    Answer(id: UUID(),title: "always_works", isCorrect: false),
                                    Answer(id: UUID(),title: "automatically_becomes_String", isCorrect: false)
                                ],
                                descriptionText: "Rust_requires_lifetime_parameters_for_references",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_fix_a_struct_with_str",
                                answers: [
                                    Answer(id: UUID(),title: "struct_User_username_str", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_User_a_username_a_str", isCorrect: true),
                                    Answer(id: UUID(),title: "struct_User_username_str", isCorrect: false),
                                    Answer(id: UUID(),title: "struct_User_static_str", isCorrect: false)
                                ],
                                descriptionText: "references_need_a_lifetime",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_is_area_width_height_inconvenient",
                                answers: [
                                    Answer(id: UUID(),title: "the_call_is_too_long", isCorrect: false),
                                    Answer(id: UUID(),title: "theres_no_relationship_between_the_parameters", isCorrect: true),
                                    Answer(id: UUID(),title: "Rust_doesnt_support_two_parameter_functions", isCorrect: false),
                                    Answer(id: UUID(),title: "its_slower", isCorrect: false)
                                ],
                                descriptionText: "width_and_height_arent_tied_together",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_is_a_tuple_inconvenient_for_a_rectangle",
                                answers: [
                                    Answer(id: UUID(),title: "no_field_names_only_indices", isCorrect: true),
                                    Answer(id: UUID(),title: "doesnt_support_multiplication", isCorrect: false),
                                    Answer(id: UUID(),title: "slower_than_a_struct", isCorrect: false),
                                    Answer(id: UUID(),title: "doesnt_store_numbers", isCorrect: false)
                                ],
                                descriptionText: "with_tuples_you_must_remember_indices",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "why_is_struct_Rectangle_better_than_a_tuple",
                                answers: [
                                    Answer(id: UUID(),title: "stores_data_on_the_heap", isCorrect: false),
                                    Answer(id: UUID(),title: "gives_field_names_width_and_height", isCorrect: true),
                                    Answer(id: UUID(),title: "can_only_be_used_in_main", isCorrect: false),
                                    Answer(id: UUID(),title: "always_gets_copied", isCorrect: false)
                                ],
                                descriptionText: "a_struct_adds_semantics",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_with_println_rect1",
                                answers: [
                                    Answer(id: UUID(),title: "it_prints_the_struct", isCorrect: false),
                                    Answer(id: UUID(),title: "error_no_Display", isCorrect: true),
                                    Answer(id: UUID(),title: "panic", isCorrect: false),
                                    Answer(id: UUID(),title: "always_works", isCorrect: false)
                                ],
                                descriptionText: "structs_dont_have_Display_by_default",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "whats_needed_for_debug_formatting",
                                answers: [
                                    Answer(id: UUID(),title: "implement_Display", isCorrect: false),
                                    Answer(id: UUID(),title: "use_and_derive_Debug", isCorrect: true),
                                    Answer(id: UUID(),title: "just_println", isCorrect: false),
                                    Answer(id: UUID(),title: "dbg_is_enough", isCorrect: false)
                                ],
                                descriptionText: "Debug_must_be_explicitly_enabled",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_dbg_differ_from_println",
                                answers: [
                                    Answer(id: UUID(),title: "dbg_always_colors_text", isCorrect: false),
                                    Answer(id: UUID(),title: "dbg_prints_to_stderr_and_returns_the_value", isCorrect: true),
                                    Answer(id: UUID(),title: "dbg_works_only_for_numbers", isCorrect: false),
                                    Answer(id: UUID(),title: "println_is_faster", isCorrect: false)
                                ],
                                descriptionText: "dbg_is_handy_for_debugging",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_declare_a_method_for_a_struct",
                                answers: [
                                    Answer(id: UUID(),title: "fn_area_self", isCorrect: false),
                                    Answer(id: UUID(),title: "impl_Rectangle_fn_area_self", isCorrect: true),
                                    Answer(id: UUID(),title: "Rectangle_area_fn", isCorrect: false),
                                    Answer(id: UUID(),title: "method_Rectangle_area", isCorrect: false)
                                ],
                                descriptionText: "methods_live_inside_impl_blocks",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_a_function_differ_from_a_method",
                                answers: [
                                    Answer(id: UUID(),title: "a_method_always_returns_self", isCorrect: false),
                                    Answer(id: UUID(),title: "a_method_is_always_public", isCorrect: false),
                                    Answer(id: UUID(),title: "a_method_is_inside_impl_and_takes_self", isCorrect: true),
                                    Answer(id: UUID(),title: "a_function_works_only_in_main", isCorrect: false)
                                ],
                                descriptionText: "a_method_is_a_function_bound_to_a_type",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_self_mean",
                                answers: [
                                    Answer(id: UUID(),title: "the_method_takes_a_copy", isCorrect: false),
                                    Answer(id: UUID(),title: "the_method_takes_a_reference_to_itself", isCorrect: true),
                                    Answer(id: UUID(),title: "the_method_requires_mut", isCorrect: false),
                                    Answer(id: UUID(),title: "the_method_transfers_ownership", isCorrect: false)
                                ],
                                descriptionText: "self_is_sugar_for_self_Self",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_declare_a_method_that_changes_fields",
                                answers: [
                                    Answer(id: UUID(),title: "fn_change_self", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_change_mut_self", isCorrect: false),
                                    Answer(id: UUID(),title: "fn_change_mut_self", isCorrect: true),
                                    Answer(id: UUID(),title: "fn_change_self", isCorrect: false)
                                ],
                                descriptionText: "you_need_mut_self",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_the_can_hold_method_do",
                                answers: [
                                    Answer(id: UUID(),title: "compares_two_numbers", isCorrect: false),
                                    Answer(id: UUID(),title: "checks_whether_one_Rectangle_fits_inside_another", isCorrect: true),
                                    Answer(id: UUID(),title: "creates_a_new_Rectangle", isCorrect: false),
                                    Answer(id: UUID(),title: "checks_Debug", isCorrect: false)
                                ],
                                descriptionText: "compares_width_and_height",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_call_a_method",
                                answers: [
                                    Answer(id: UUID(),title: "Rectangle_area_rect", isCorrect: false),
                                    Answer(id: UUID(),title: "rect_area", isCorrect: true),
                                    Answer(id: UUID(),title: "area_rect", isCorrect: false),
                                    Answer(id: UUID(),title: "rect_area", isCorrect: false)
                                ],
                                descriptionText: "use_instance_method",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_an_associated_function",
                                answers: [
                                    Answer(id: UUID(),title: "always_a_static_method", isCorrect: false),
                                    Answer(id: UUID(),title: "any_function_inside_impl", isCorrect: false),
                                    Answer(id: UUID(),title: "a_function_without_self", isCorrect: true),
                                    Answer(id: UUID(),title: "only_a_constructor", isCorrect: false)
                                ],
                                descriptionText: "an_associated_function_doesnt_take_self",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_do_you_call_an_associated_function",
                                answers: [
                                    Answer(id: UUID(),title: "Rectangle_square_3", isCorrect: true),
                                    Answer(id: UUID(),title: "rect_square_3", isCorrect: false),
                                    Answer(id: UUID(),title: "new_Rectangle_3", isCorrect: false),
                                    Answer(id: UUID(),title: "square_Rectangle_3", isCorrect: false)
                                ],
                                descriptionText: "use_Type_func",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_Self_refer_to_in_an_impl",
                                answers: [
                                    Answer(id: UUID(),title: "empty_tuple", isCorrect: false),
                                    Answer(id: UUID(),title: "the_structs_type_name", isCorrect: true),
                                    Answer(id: UUID(),title: "static_struct", isCorrect: false),
                                    Answer(id: UUID(),title: "void", isCorrect: false)
                                ],
                                descriptionText: "Self_equals_the_type_being_implemented",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "can_you_have_multiple_impl_blocks_for_one_struct",
                                answers: [
                                    Answer(id: UUID(),title: "no", isCorrect: false),
                                    Answer(id: UUID(),title: "yes_and_thats_valid_syntax", isCorrect: true),
                                    Answer(id: UUID(),title: "only_when_using_a_trait", isCorrect: false),
                                    Answer(id: UUID(),title: "only_on_nightly", isCorrect: false)
                                ],
                                descriptionText: "you_can_split_impls",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_happens_if_a_method_and_a_field_share_a_name",
                                answers: [
                                    Answer(id: UUID(),title: "error", isCorrect: false),
                                    Answer(id: UUID(),title: "Rust_distinguishes_them_rect_width_field_vs_rect_width_method", isCorrect: true),
                                    Answer(id: UUID(),title: "the_method_overwrites_the_field", isCorrect: false),
                                    Answer(id: UUID(),title: "the_field_becomes_private", isCorrect: false)
                                ],
                                descriptionText: "parentheses_indicate_a_method_call",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_a_getter_in_Rust",
                                answers: [
                                    Answer(id: UUID(),title: "generated_automatically", isCorrect: false),
                                    Answer(id: UUID(),title: "you_write_it_manually_typically_returning_a_field", isCorrect: true),
                                    Answer(id: UUID(),title: "not_supported", isCorrect: false),
                                    Answer(id: UUID(),title: "created_via_a_macro", isCorrect: false)
                                ],
                                descriptionText: "Rust_doesnt_auto_generate_getters",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "how_does_Rust_replace_from_C",
                                answers: [
                                    Answer(id: UUID(),title: "Rust_also_uses", isCorrect: false),
                                    Answer(id: UUID(),title: "Rust_uses_auto_ref_deref_when_calling_methods", isCorrect: true),
                                    Answer(id: UUID(),title: "Rust_requires_before_the_call", isCorrect: false),
                                    Answer(id: UUID(),title: "Rust_always_copies", isCorrect: false)
                                ],
                                descriptionText: "Rust_auto_references_as_needed",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_dbg_print_for_dbg_30_2",
                                answers: [
                                    Answer(id: UUID(),title: "only_the_number", isCorrect: false),
                                    Answer(id: UUID(),title: "file_line_and_result", isCorrect: true),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false),
                                    Answer(id: UUID(),title: "compiler_error", isCorrect: false)
                                ],
                                descriptionText: "dbg_prints_context_value",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_is_the_pretty_debug_syntax",
                                answers: [
                                    Answer(id: UUID(),title: "pretty", isCorrect: true),
                                    Answer(id: UUID(),title: "debug", isCorrect: false),
                                    Answer(id: UUID(),title: "debug", isCorrect: false),
                                    Answer(id: UUID(),title: "debug", isCorrect: false)
                                ],
                                descriptionText: "pretty_print_is_pretty",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "what_does_impl_Rectangle_fn_new_Self_do",
                                answers: [
                                    Answer(id: UUID(),title: "not_allowed", isCorrect: false),
                                    Answer(id: UUID(),title: "defines_an_associated_function_constructor", isCorrect: true),
                                    Answer(id: UUID(),title: "defines_a_method", isCorrect: false),
                                    Answer(id: UUID(),title: "nothing", isCorrect: false)
                                ],
                                descriptionText: "a_constructor_via_new",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                            Question(
                                id: UUID(),
                                title: "bottom_line_why_use_structs",
                                answers: [
                                    Answer(id: UUID(),title: "to_replace_enums", isCorrect: false),
                                    Answer(id: UUID(),title: "to_store_values_like_an_array", isCorrect: false),
                                    Answer(id: UUID(),title: "to_group_related_data_with_names_and_behavior", isCorrect: true),
                                    Answer(id: UUID(),title: "to_speed_up_compilation", isCorrect: false)
                                ],
                                descriptionText: "a_struct_groups_data_and_methods",
                                descriptionLink: "using_structs_to_structure_related_data_link"
                            ),
                        ]
                    )
                ]
            )
        }
    )
}

extension DependencyValues {
    var seedService: SeedService {
        get { self[SeedService.self] }
        set { self[SeedService.self] = newValue }
    }
}
