Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qAGCmIgH025601
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2012 07:48:19 -0500
Received: from tropek.jajcus.net (tropek.jajcus.net [84.205.176.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAGCmFWL027314
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2012 07:48:16 -0500
Received: from localhost (jajo.ipv6.eggsoft.pl [IPv6:2001:6a0:117::1])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by tropek.jajcus.net (Postfix) with ESMTPSA id 6142B5002
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2012 13:48:13 +0100 (CET)
Date: Fri, 16 Nov 2012 13:48:09 +0100
From: Jacek Konieczny <jajcus@jajcus.net>
Message-ID: <20121116124809.GA25670@jajo.eggsoft>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] cluster request failed: Host is down
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@redhat.com

Hi,

I have seen this problem already reported here, but with no useful
answer:

http://osdir.com/ml/linux-lvm/2011-01/msg00038.html

This post suggest it is some very old bug, a change which can be easily
reverted=E2=80=A6 though, it is a bit hard to believe. Such an easy bug, wo=
uld
be already fixed, wouldn't it?

For me the problem is as follows:

I have a two node cluster with a volume group running on a DRBD in
Master-Master setup. When I shut one node down, cleanly, I am not able
to properly manage the volumes.=20

LVs which are active on the surviving host remain active, but I am not
able to deactivate them or activate more volumes:

>  [root@dev1n1 ~]# lvs dev1_vg/4bwM2m7oVL
>    cluster request failed: Host is down
>    LV         VG        Attr      LSize Pool Origin Data%  Move Log Copy%=
  Convert
>    4bwM2m7oVL dev1_vg -wi------ 1.00g                                    =
      =20
>  [root@dev1n1 ~]# lvchange -aey dev1_vg/XaMS0LyAq8 ; echo $?
>    cluster request failed: Host is down
>    cluster request failed: Host is down
>    cluster request failed: Host is down
>    cluster request failed: Host is down
>    cluster request failed: Host is down
>  5
>  [root@dev1n1 ~]# lvs dev1_vg/4bwM2m7oVL
>    cluster request failed: Host is down
>    LV         VG        Attr      LSize Pool Origin Data%  Move Log Copy%=
  Convert
>    4bwM2m7oVL dev1_vg -wi------ 1.00g                                    =
      =20
>  [root@dev1n1 ~]# lvchange -aen dev1_vg/XaMS0LyAq8 ; echo $?
>    cluster request failed: Host is down
>    cluster request failed: Host is down
>  5
>  [root@dev1n1 ~]# lvs dev1_vg/XaMS0LyAq8
>    cluster request failed: Host is down
>    LV         VG        Attr      LSize Pool Origin Data%  Move Log Copy%=
  Convert
>    XaMS0LyAq8 dev1_vg -wi-a---- 1.00g                                    =
      =20
> =20
>  [root@dev1n1 ~]# dlm_tool ls
>  dlm lockspaces
>  name          clvmd
>  id            0x4104eefa
>  flags         0x00000000=20
>  change        member 1 joined 0 remove 1 failed 0 seq 2,2
>  members       1=20
> =20
>  [root@dev1n1 ~]# dlm_tool status
>  cluster nodeid 1 quorate 1 ring seq 30648 30648
>  daemon now 1115 fence_pid 0=20
>  node 1 M add 15 rem 0 fail 0 fence 0 at 0 0
>  node 2 X add 15 rem 184 fail 0 fence 0 at 0 0

The node has cleanly left the lockspace and the cluster. DLM is aware
about that, so should be clvmd, right? And if all other cluster nodes
(only one here) are clean, all LVM operations on the clustered VG should
work, right? Or am I missing something?

The behaviour is exactly the same when I power off a running node. It
is fenced by dlm_tool, as expected and then the VG is non-functional as
above, until the dead node is up again and joins the cluster.

Is this the expected behaviour or is it a bug?

Greets,
        Jacek
