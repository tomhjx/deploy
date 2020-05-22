# 构建镜像后
function after_build_image()
{
    say_progress_begin "删除临时代码"
    info "临时代码路径：${src_stage_dir}"
    rm -r ${src_stage_dir}/* 
}