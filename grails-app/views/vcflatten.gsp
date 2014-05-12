<!doctype html>
<html>
<head>

<title>vcflatten</title>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="span12">
				<p>This is a command line tool for "flattening" a VCF (4+) file down to simpler TSV files.
				Essentially, it takes the information from the INFO column and from the sample columns
				and spreads them out into their own, separate columns.</p>
				
				<h3>Installing vcflatten</h3>
				 
				<p>Before installing vcflatten, you will need to have installed <strong>Java</strong> (version 1.6+)
				and <strong>BASH</strong> (BASH is already installed on Mac OS X and comes with most Linux
				distributions' base install).</p>
				
				<p>After this, you can grab the <a href="https://github.com/innovativemedicine/vcfimp/downloads">
				latest release as a ZIP file from Github</a> or just use the link below.</p>
				
				<ul>
					<li><a href="https://github.com/downloads/innovativemedicine/vcfimp/vcflatten-0.5.2.zip">vcflatten 0.5.2</a></li>
				</ul>
				
				<p>The ZIP file contains the application and all its dependencies as a single JAR, along with a
				BASH script to run it. You will probably need to mark the script as executable.</p>
				
				<p>Alternatively, the following commands will download the latest release, unzip it, and display
				the help text:</p>
				
				<pre><code>$ wget https://github.com/downloads/innovativemedicine/vcfimp/vcflatten-0.5.2.zip
$ unzip vcflatten-0.5.2.zip
$ chmod vcflatten-0.5.2/bin/vcflatten
$ ./vcflatten-0.5.2/bin/vcflatten --help</code></pre> 
				
				<h3>Using vcflatten</h3>
				
				<p>To show the purpose of <strong>vcflatten</strong> we will use an example. Say you
				have a VCF file that looks like the following (omitting the <strong>required</strong>
				metadata header):</p>
				
				<table class="table table-condensed">
					<caption><strong>Input</strong><br />File: ex.vcf.gz</caption>
					<thead>
						<tr>
							<th>#CHROM</th>
							<th>POS</th>
							<th>ID</th>
							<th>REF</th>
							<th>ALT</th>
							<th>QUAL</th>
							<th>FILTER</th>
							<th>INFO <em>(abbreviated)</em></th>
							<th>FORMAT</th>
							<th>HG00096</th>
							<th>HG00097</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>13</td>
							<td>32889669</td>
							<td>rs55880202</td>
							<td>C</td>
							<td>T</td>
							<td>100</td>
							<td>PASS</td>
							<td>AA=C;AN=2184;LDAF=0.0102;...<!-- VT=SNP;RSQ=0.8150;THETA=0.0195;SNPSOURCE=LOWCOV;AVGPOST=0.9958;AC=19;ERATE=0.0007;AF=0.01;AMR_AF=0.0028;AFR_AF=0.04 --></td>
							<td>GT:DS:GL</td>
							<td>0|0:0.000:-0.18,-0.47,-2.41</td>
							<td>0|0:0.000:-0.48,-0.48,-0.48</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889792</td>
							<td>rs206118</td>
							<td>A</td>
							<td>G</td>
							<td>100</td>
							<td>PASS</td>
							<td>AN=2184;AC=341;VT=SNP;...<!-- AA=A;THETA=0.0144;ERATE=0.0018;SNPSOURCE=LOWCOV;LDAF=0.1600;RSQ=0.9161;AVGPOST=0.9707;AF=0.16;ASN_AF=0.18;AMR_AF=0.14;AFR_AF=0.13;EUR_AF=0.16 --></td>
							<td>GT:DS:GL</td>
							<td>0|0:0.000:-0.10,-0.68,-4.70</td>
							<td>1|0:0.850:-0.04,-1.01,-5.00</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889968</td>
							<td>rs206119</td>
							<td>G</td>
							<td>A</td>
							<td>100</td>
							<td>PASS</td>
							<td>AVGPOST=0.9291;AN=2184;...<!-- RSQ=0.8755;VT=SNP;AA=A;AC=1602;THETA=0.0149;ERATE=0.0187;SNPSOURCE=LOWCOV;LDAF=0.7241;AF=0.73;ASN_AF=0.86;AMR_AF=0.72;AFR_AF=0.53;EUR_AF=0.78 --></td>
							<td>GT:DS:GL</td>
							<td>1|1:2.000:-5.00,-0.91,-0.06</td>
							<td>1|1:2.000:-5.00,-1.84,-0.01</td>
						</tr>
					</tbody>
				</table>
				
				<p>And you wish to <em>flatten</em> this down so you can view the <strong>AA</strong>, <strong>AN</strong>,
				and <strong>AC</strong> info fields for each variant, along with the <strong>GT</strong> and <strong>GL</strong>
				data for each sample. Then, you can run <strong>vcflatten</strong> with <em>(Note: the delimiter used to
				separate the INFO fields and the sample data are the same as those used in the VCF file for the INFO and FORMAT
				columns respectively)</em>:</p>
				
				<pre><code>$ vcflatten --info 'AA;AN;AC' --genotype 'GT:GL' ex.vcf.gz</code></pre>
				
				<p>This command will produce 2 new TSV files, 1 for each of the 2 samples.</p>
				
				<table class="table table-condensed">
					<caption><strong>Output</strong><br />File: ex.vcf.gz-HG00096-1.tsv</caption>
					<thead>
						<tr>
							<th>#CHROM</th>
							<th>POS</th>
							<th>ID</th>
							<th>REF</th>
							<th>ALT</th>
							<th>QUAL</th>
							<th>FILTER</th>
							<th>AA</th>
							<th>AN</th>
							<th>AC</th>
							<th>GT</th>
							<th>GL</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>13</td>
							<td>32889669</td>
							<td>rs55880202</td>
							<td>C</td>
							<td>T</td>
							<td>100</td>
							<td>PASS</td>
							<td>C</td>
							<td>2184</td>
							<td>19</td>
							<td>0|0</td>
							<td>-0.18,-0.47,-2.41</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889792</td>
							<td>rs206118</td>
							<td>A</td>
							<td>G</td>
							<td>100</td>
							<td>PASS</td>
							<td>A</td>
							<td>2184</td>
							<td>341</td>
							<td>0|0</td>
							<td>-0.1,-0.68,-4.7</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889968</td>
							<td>rs206119</td>
							<td>G</td>
							<td>A</td>
							<td>100</td>
							<td>PASS</td>
							<td>A</td>
							<td>2184</td>
							<td>1602</td>
							<td>1|1</td>
							<td>-5.0,-0.91,-0.06</td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-condensed">
					<caption><strong>Output</strong><br />File: ex.vcf.gz-HG00097-2.tsv</caption>
					<thead>
						<tr>
							<th>#CHROM</th>
							<th>POS</th>
							<th>ID</th>
							<th>REF</th>
							<th>ALT</th>
							<th>QUAL</th>
							<th>FILTER</th>
							<th>AA</th>
							<th>AN</th>
							<th>AC</th>
							<th>GT</th>
							<th>GL</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>13</td>
							<td>32889669</td>
							<td>rs55880202</td>
							<td>C</td>
							<td>T</td>
							<td>100</td>
							<td>PASS</td>
							<td>C</td>
							<td>2184</td>
							<td>19</td>
							<td>0|0</td>
							<td>-0.48,-0.48,-0.48</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889792</td>
							<td>rs206118</td>
							<td>A</td>
							<td>G</td>
							<td>100</td>
							<td>PASS</td>
							<td>A</td>
							<td>2184</td>
							<td>341</td>
							<td>1|0</td>
							<td>-0.04,-1.01,-5.0</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889968</td>
							<td>rs206119</td>
							<td>G</td>
							<td>A</td>
							<td>100</td>
							<td>PASS</td>
							<td>A</td>
							<td>2184</td>
							<td>1602</td>
							<td>1|1</td>
							<td>-5.0,-1.84,-0.01</td>
						</tr>
					</tbody>
				</table>
				
				
				<p>You can also flatten a VCF file with multiple samples into a single file with the
				<strong>--one-file</strong> command line switch. In this case, an extra <em>sample</em>
				column will be added to the VCF file, so you can determine which sample a particular
				row belongs to. Using the example above, we could run:</p>
				
				<pre><code>$ vcflatten --info 'AA;AN;AC' --genotype 'GT:GL' --one-file ex.vcf.gz</code></pre>
				
				Which will produce the following file:
				
				<table class="table table-condensed">
					<caption><strong>Output</strong><br />File: ex.vcf.gz-all-1.tsv</caption>
					<thead>
						<tr>
							<th>#CHROM</th>
							<th>POS</th>
							<th>ID</th>
							<th>REF</th>
							<th>ALT</th>
							<th>QUAL</th>
							<th>FILTER</th>
							<th>AA</th>
							<th>AN</th>
							<th>AC</th>
							<th>SAMPLE</th>
							<th>GT</th>
							<th>GL</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>13</td>
							<td>32889669</td>
							<td>rs55880202</td>
							<td>C</td>
							<td>T</td>
							<td>100</td>
							<td>PASS</td>
							<td>C</td>
							<td>2184</td>
							<td>19</td>
							<td>HG00096</td>
							<td>0|0</td>
							<td>-0.18,-0.47,-2.41</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889669</td>
							<td>rs55880202</td>
							<td>C</td>
							<td>T</td>
							<td>100</td>
							<td>PASS</td>
							<td>C</td>
							<td>2184</td>
							<td>19</td>
							<td>HG00097</td>
							<td>0|0</td>
							<td>-0.48,-0.48,-0.48</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889792</td>
							<td>rs206118</td>
							<td>A</td>
							<td>G</td>
							<td>100</td>
							<td>PASS</td>
							<td>A</td>
							<td>2184</td>
							<td>341</td>
							<td>HG00096</td>
							<td>0|0</td>
							<td>-0.1,-0.68,-4.7</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889792</td>
							<td>rs206118</td>
							<td>A</td>
							<td>G</td>
							<td>100</td>
							<td>PASS</td>
							<td>A</td>
							<td>2184</td>
							<td>341</td>
							<td>HG00097</td>
							<td>1|0</td>
							<td>-0.04,-1.01,-5.0</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889968</td>
							<td>rs206119</td>
							<td>G</td>
							<td>A</td>
							<td>100</td>
							<td>PASS</td>
							<td>A</td>
							<td>2184</td>
							<td>1602</td>
							<td>HG00096</td>
							<td>1|1</td>
							<td>-5.0,-0.91,-0.06</td>
						</tr>
						<tr>
							<td>13</td>
							<td>32889968</td>
							<td>rs206119</td>
							<td>G</td>
							<td>A</td>
							<td>100</td>
							<td>PASS</td>
							<td>A</td>
							<td>2184</td>
							<td>1602</td>
							<td>HG00097</td>
							<td>1|1</td>
							<td>-5.0,-1.84,-0.01</td>
						</tr>
					</tbody>
				</table>
				
				<p>There are more options available; to see them, run <strong>vcflatten</strong> with the
				<strong>--help</strong> command line switch.</p>
				
				<h3>Integrating with Other Tools</h3>
				
				<p>If an input file is not provided, vcflatten will read from standard input. This means
				you can pipe the output of some tools into vcflatten. However, because vcflatten may create
				many output files from a single input file, it doesn't currently provide a mechanism to write
				the output to standard out. An option to do this, in conjunction with the <strong>--one-file</strong>
				switch should be available soon though.</p>
				
				<p>As an example, if you wish to only include certain samples, I'd suggest you pipe the VCF
				file through <a href="http://vcftools.sourceforge.net/perl_module.html#vcf-subset">vcf-subset</a> 
				(part of the vcftools package) first:</p>
				
				<pre><code>$ vcf-subset -c HG00096,HG00097 ex-full.vcf.gz | vcflatten</code></pre>
				
				<h3>Getting the Source</h3>
				
				<p>The <a href="https://github.com/innovativemedicine/vcfimp">source code (Scala) for vcflatten</a> is available on GitHub.
				It is actually a sub-project of a larger <strong>vcfimp</strong> project, which includes a VCF parser written in
				Scala. Instructions for building from the source code can be found in the README on the project page.</p>
			</div>
		</div>
	</div>
</body>