Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1CAbaHR003145
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 05:37:36 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id n1CAaw5u004808
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 05:36:58 -0500
Content-Type: text/plain; charset="iso-8859-1"
Date: Thu, 12 Feb 2009 11:36:57 +0100
From: "Manuel Neuger" <mneuger@gmx.at>
Message-ID: <20090212103657.41710@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] clustered lvm without clvmd
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

Hi all,

I have a lvm VG on top of a iscsi lun, and want to share that on=20
multiple hosts in order to run kvm virtual machines on logical volumes.

I recently noticed that xen-server also do this, but they do not run clvmd.=
 Can someone explain how that could work?

I also detected that I can protect LVs by using 'tags'. That way I can
make sure that LVs are only activated by one host?

It is also no problem to restrict VG write access to one host (master).=20

The only problem I see is how to propagate metadata changes to the other
nodes. How do I make sure that metadata is written back to the iscsi storag=
e? And is it enough to simple issue a 'vgsvan' on all nodes? Or is
that a bad idea?

- Manuel

--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=EF=BF=BDrt? Der kann`s mit a=
llen: http://www.gmx.net/de/go/multimessenger01
