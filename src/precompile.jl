# This file is mostly generated by `scripts/generate_precompile.jl`

const __bodyfunction__ = Dict{Method,Any}()

# Find keyword "body functions" (the function that contains the body
# as written by the developer, called after all missing keyword-arguments
# have been assigned values), in a manner that doesn't depend on
# gensymmed names.
# `mnokw` is the method that gets called when you invoke it without
# supplying any keywords.
function __lookup_kwbody__(mnokw::Method)
    function getsym(arg)
        isa(arg, Symbol) && return arg
        @assert isa(arg, GlobalRef)
        return arg.name
    end

    f = get(__bodyfunction__, mnokw, nothing)
    if f === nothing
        fmod = mnokw.module
        # The lowered code for `mnokw` should look like
        #   %1 = mkw(kwvalues..., #self#, args...)
        #        return %1
        # where `mkw` is the name of the "active" keyword body-function.
        ast = Base.uncompressed_ast(mnokw)
        if isa(ast, Core.CodeInfo) && length(ast.code) >= 2
            callexpr = ast.code[end-1]
            if isa(callexpr, Expr) && callexpr.head == :call
                fsym = callexpr.args[1]
                if isa(fsym, Symbol)
                    f = getfield(fmod, fsym)
                elseif isa(fsym, GlobalRef)
                    if fsym.mod === Core && fsym.name === :_apply
                        f = getfield(mnokw.module, getsym(callexpr.args[2]))
                    elseif fsym.mod === Core && fsym.name === :_apply_iterate
                        f = getfield(mnokw.module, getsym(callexpr.args[3]))
                    else
                        f = getfield(fsym.mod, fsym.name)
                    end
                else
                    f = missing
                end
            else
                f = missing
            end
        else
            f = missing
        end
        __bodyfunction__[mnokw] = f
    end
    return f
end

function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    try; @assert(Base.precompile(Tuple{Core.kwftype(typeof(Type)),NamedTuple{(:rl, :ll, :url, :detail), NTuple{4, String}},Type{CompletionSuggestion},String,String,String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{Core.kwftype(typeof(_collecttoplevelitems_static)),NamedTuple{(:inmod,), Tuple{Bool}},typeof(_collecttoplevelitems_static),Nothing,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{Core.kwftype(typeof(modulefiles)),NamedTuple{(:inmod,), Tuple{Bool}},typeof(modulefiles),String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{Core.kwftype(typeof(toplevelitems)),NamedTuple{(:mod, :inmod), Tuple{String, Bool}},typeof(toplevelitems),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{Type{EvalError},StackOverflowError,Vector{StackFrame}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{Type{GotoItem},String,ToplevelCall})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{Type{GotoItem},String,ToplevelMacroCall})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{Type{GotoItem},String,ToplevelModuleUsage})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(allprojects)})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(appendline),String,Int64})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(clearsymbols)})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,FuzzyCompletions.DictCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,FuzzyCompletions.FieldCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,FuzzyCompletions.KeywordCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,FuzzyCompletions.ModuleCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,FuzzyCompletions.PathCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,FuzzyCompletions.PropertyCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,REPL.REPLCompletions.DictCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,REPL.REPLCompletions.FieldCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,REPL.REPLCompletions.KeywordCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,REPL.REPLCompletions.ModuleCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,REPL.REPLCompletions.PathCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completion),Module,REPL.REPLCompletions.PropertyCompletion,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(completiondetail!),Dict{String, Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(description),MD})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(displayandrender),Module})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(displayandrender),Symbol})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(docs),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(eval),String,Int64,String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(evalall),String,String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(evalshow),String,Int64,String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(evalsimple),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(finddevpackages)})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(fullREPLpath),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(fullpath),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(fuzzycompletionadapter),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(getdocs),Module,String,Module})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(getdocs),Module,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(getfield′),Any,String,Undefined})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(getfield′),Any,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(getfield′),Any,Symbol,Undefined})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(getfield′),Any,Symbol})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(getfield′),Module,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(getfield′),Module,Symbol,Function})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(getfield′),Module,Symbol})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(globaldatatip),String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(globalgotoitems),String,Module,String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(globalgotoitems),String,String,String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(gotosymbol),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(handlemsg),Dict{String, Any},String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(handlemsg),Dict{String, Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isactive),IOBuffer})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(iskeyword),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(ismacro),Any})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(ismacro),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Base.RefValue{Bool}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Base.RefValue{Tuple{String, Int64}}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Dict{Method, Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Dict{String, Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Dict{String, Dict{String, Vector{GotoItem}}}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Dict{String, String}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Dict{String, Vector{String}}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Function})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),HTML{String}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Int64})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Module})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),NTuple{19, Symbol}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),OrderedDict{String, Union{NamedTuple{(:rt, :desc), Tuple{String, String}}, NamedTuple{(:f, :m, :tt), Tuple{Any, Method, Type}}}}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Regex})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Type})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Undefined})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Vector{Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(isundefined),Vector{String}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(localgotoitem),String,Nothing,Int64,Int64,Int64,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(md_hlines),MD})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(moduledefinition),Module})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(modulefiles),Module})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(modulefiles),String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(msg),String,Int64,Vararg{Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(pkgpath),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(pluralize),Vector{Int64},String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(processdoc!),MD,String,Vector{Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(processdocs),Vector{Tuple{Float64, DocSeeker.DocObj}}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(processval!),Any,String,Vector{Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(processval!),Function,String,Vector{Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(project_info)})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(realpath′),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(regeneratesymbols)})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render),Inline,EvalError{StackOverflowError}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render),Inline,Function})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render),Inline,Model})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render),Inline,Module})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render),Inline,Node{:div}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render),Inline,Node{:span}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render),Inline,Symbol})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render),Inline,Type})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(renderMDinline),Vector{Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render′),Inline,Function})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render′),Inline,Int64})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render′),Inline,Module})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render′),Inline,Nothing})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render′),Inline,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render′),Inline,Type})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(render′),Inline,Undefined})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(replcompletionadapter),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(searchcodeblocks),MD})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(searchdocs′),String,Bool,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(searchdocs′),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(str_value),EXPR})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(strlimit),String,Int64,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(strlimit),String,Int64})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(toplevelitems),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(trim),Vector{Float64},Int64})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(updatesymbols),String,Nothing,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(updatesymbols),String,String,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(use_compiled_modules)})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Dict{Any, Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Dict{Symbol, Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Method})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:a}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:blockquote}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:em}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:h1}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:h2}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:hr}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:img}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:li}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:pre}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:p}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:strong}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),Node{:ul}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(view),SubString{String}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(withpath),Function,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(workspace),String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Any})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Array{Bool, 0}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Base.EnvDict})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Complex{Bool}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Dict{Method, Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Dict{String, Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Dict{String, Dict{String, Vector{GotoItem}}}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Dict{String, String}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Dict{String, Vector{String}}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,ErrorException})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Float16})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Float32})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Float64})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Function})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Int64})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Irrational{:π}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Irrational{:ℯ}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Module})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,OrderedDict{String, Union{NamedTuple{(:rt, :desc), Tuple{String, String}}, NamedTuple{(:f, :m, :tt), Tuple{Any, Method, Type}}}}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Regex})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,String})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Type})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Undefined})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Vector{Any}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wsicon),Module,Symbol,Vector{String}})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wstype),Module,Symbol,Any})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wstype),Module,Symbol,ErrorException})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wstype),Module,Symbol,Function})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wstype),Module,Symbol,Module})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wstype),Module,Symbol,Type})); catch err; @debug err; end
    try; @assert(Base.precompile(Tuple{typeof(wstype),Module,Symbol,Undefined})); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),HorizontalRule}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),MD}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),Markdown.Admonition}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),Markdown.BlockQuote}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),Markdown.Code}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),Markdown.Footnote}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),Markdown.Header{1}}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),Markdown.Header{2}}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),Markdown.List}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#113#114")) && Base.precompile(Tuple{getfield(Atom, Symbol("#113#114")),Markdown.Paragraph}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#115#116")) && Base.precompile(Tuple{getfield(Atom, Symbol("#115#116")),Vector{Any}}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#121#122")) && Base.precompile(Tuple{getfield(Atom, Symbol("#121#122")),Markdown.Bold}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#121#122")) && Base.precompile(Tuple{getfield(Atom, Symbol("#121#122")),Markdown.Code}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#121#122")) && Base.precompile(Tuple{getfield(Atom, Symbol("#121#122")),Markdown.Footnote}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#121#122")) && Base.precompile(Tuple{getfield(Atom, Symbol("#121#122")),Markdown.Image}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#121#122")) && Base.precompile(Tuple{getfield(Atom, Symbol("#121#122")),Markdown.Italic}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#121#122")) && Base.precompile(Tuple{getfield(Atom, Symbol("#121#122")),Markdown.LaTeX}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#121#122")) && Base.precompile(Tuple{getfield(Atom, Symbol("#121#122")),Markdown.Link}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#121#122")) && Base.precompile(Tuple{getfield(Atom, Symbol("#121#122")),String}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#123#124")) && Base.precompile(Tuple{getfield(Atom, Symbol("#123#124")),Model}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#131#132")) && Base.precompile(Tuple{getfield(Atom, Symbol("#131#132")),Text{String}}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#200#201")) && Base.precompile(Tuple{getfield(Atom, Symbol("#200#201"))}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#207#212")) && Base.precompile(Tuple{getfield(Atom, Symbol("#207#212"))}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#208#213")) && Base.precompile(Tuple{getfield(Atom, Symbol("#208#213"))}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#220#225")) && Base.precompile(Tuple{getfield(Atom, Symbol("#220#225"))}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#234#239")) && Base.precompile(Tuple{getfield(Atom, Symbol("#234#239"))}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#242#243")) && Base.precompile(Tuple{getfield(Atom, Symbol("#242#243")),MD}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#242#243")) && Base.precompile(Tuple{getfield(Atom, Symbol("#242#243")),Method}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#39#40")) && Base.precompile(Tuple{getfield(Atom, Symbol("#39#40"))}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#43#44")) && Base.precompile(Tuple{getfield(Atom, Symbol("#43#44")),String}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#45#47")) && Base.precompile(Tuple{getfield(Atom, Symbol("#45#47")),String}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#61#62")) && Base.precompile(Tuple{getfield(Atom, Symbol("#61#62"))}); catch err; @debug err; end
    try; isdefined(Atom, Symbol("#r#109")) && Base.precompile(Tuple{getfield(Atom, Symbol("#r#109")),Link}); catch err; @debug err; end
    try; @assert(let fbody = try __lookup_kwbody__(which(fixpath, (String,))) catch missing end
        if !ismissing(fbody)
            precompile(fbody, (String,String,typeof(fixpath),String,))
        end
    end); catch err; @debug err; end
end
