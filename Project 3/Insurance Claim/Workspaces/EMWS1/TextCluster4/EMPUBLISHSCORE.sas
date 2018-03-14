%tmc_doc_score(import=&em_score_output,export=work._newexport,
termds=termloc.TextFilter_filtterms, configds=termloc.TextCluster4_tmconfig,
clusters=termloc.TextCluster4_clusters, emoutstat=termloc.TextCluster4_emoutstat,
_scrout=work.TextFilter_out, svd_u=termloc.TextCluster4_svd_u, svd_s=termloc.TextCluster4_svd_s, prefix=TextCluster4);
data &em_score_output; set work._newexport;
