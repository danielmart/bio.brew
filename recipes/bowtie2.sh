local version="2.0.0-beta5"
local type="zip"
local URL="http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/${version}/bowtie2-${version}-linux-x86_64.${type}"
local tb_file=`basename $URL`
local seed_name="bowtie2-${version}"
local install_files=(bowtie2 bowtie2-align bowtie2-build bowtie2-inspect)

do_install()
{
  cd $TB_DIR
  download $URL $tb_file
  decompress_tool $tb_file $type
  mv $TB_DIR/$seed_name $STAGE_DIR/$seed_name
  cd $STAGE_DIR/$seed_name
}

do_activate()
{
  link_from_stage $seed_name ${install_files[@]}
}

do_test()
{
  log "test"
}

do_remove()
{
  remove_recipe $seed_name
  remove_from_stage $seed_name ${install_files[@]}
}

source "$MAIN_DIR/lib/case.sh"
