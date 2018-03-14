%tmc_doc_score(import=&em_score_output,export=work._newexport,
termds=termloc.TextFilter_filtterms, configds=termloc.TextCluster2_tmconfig,
clusters=termloc.TextCluster2_clusters, emoutstat=termloc.TextCluster2_emoutstat,
_scrout=work.TextFilter_out, svd_u=termloc.TextCluster2_svd_u, svd_s=termloc.TextCluster2_svd_s, prefix=TextCluster2);
data &em_score_output; set work._newexport;
