Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6JFjpDS017935
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 11:45:51 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6JFjgN4006640
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 11:45:42 -0400
Received: by iwn7 with SMTP id 7so6321096iwn.33
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 08:45:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <846462.8576.qm@web137317.mail.in.yahoo.com>
References: <846462.8576.qm@web137317.mail.in.yahoo.com>
Date: Mon, 19 Jul 2010 11:45:39 -0400
Message-ID: <AANLkTiknRBZed0bWdmqb17og_i474Dvz-MNkmuSOUG_6@mail.gmail.com>
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] COW store
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jul 19, 2010 at 7:14 AM, andiket a <truly_linux@yahoo.co.in> wrote:
>
> Hi,
>
> Is it possible to specify a different device or to be specific a different VG than original VG to create a cow store for snapshot.
>
> If I have a an LV in VG1 then I don't snapshot to create cow store (snapshot LV) on same VG but to use VG2.
>
>
> Thanks.
>

Your question would make a lot more sense as:

===
Is it possible to specify a different device or to be specific a
different PV than original PV to create a cow store for snapshot?
===

Answer: Yes, when you create your main LVs and snapshot LVs you can
specify which PVs they use.

Greg
