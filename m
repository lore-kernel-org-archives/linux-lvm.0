Message-ID: <85063BBE668FD411944400D0B744267A8886B0@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
MIME-Version: 1.0
Subject: [linux-lvm] IO issue causing unkillable processes.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Oct 30 14:23:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This perl script: #!/usr/bin/perl -w

$|=1;
open(FD, ">>spew.out");
while (true) {
print FD "asdklfasd;kfjsad;kfjs;dlj
a;sdlkfnas,nfp9ibvp98ay085hq325l;mndfg'adfa
'sd;lmf,m/,sd\fasdfna.,mdnf.m,ansdflkjanfoiuahsel;kjrqwe\as\df]adfh\||PPOt'r
q[tjwq.,mnt/><ZXDNF{OLPIAHSEMN>M<Nl;kjahestlkjahsdklfmsd;lifqpownj;n;lakfn;K
H;LKH;LKGJAPSOIJ"
}
close FD;
will cause an unkillable process under the proper circumstances. I'm not
sure what they are, so...
if anyone who's NOT running xfs, rather Reiser or ext3 or ext2, and LVM,
could run this and let me know if they experience similar symptoms. I'm not
sure where the culprit is right now.(whether it's SMP, SCSI, or IDE, the VM,
whatever.) I'd greatly appreciate your help.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 
