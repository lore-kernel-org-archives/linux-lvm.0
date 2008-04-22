Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MGphhF010839
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:51:43 -0400
Received: from rv-out-0506.google.com (rv-out-0708.google.com [209.85.198.242])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MGpW2V010175
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:51:32 -0400
Received: by rv-out-0506.google.com with SMTP id b17so1256433rvf.51
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 09:51:31 -0700 (PDT)
Message-ID: <a71bd89a0804220951s1111f55bn490bd22c073c8249@mail.gmail.com>
Date: Tue, 22 Apr 2008 09:51:31 -0700
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Snapshot question...
In-Reply-To: <1208880734.7871.86.camel@pc.ilinx>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<1208880734.7871.86.camel@pc.ilinx>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

2008/4/22 Brian J. Murrell <brian@interlinx.bc.ca>:
>  Zumastor claim to have solved that with their snapshots.  I'd love to
>  have time to play with it, indeed.
>
>  If Zumastor are here listening, can you answer, are there any plans to
>  get your snapshots into the main kernel tree?

We're listening.
The patches are a little invasive (they touch the VM
system -- zumastor triggers an old deadlock in the kernel,
and we have a fix for it), so
it's not clear they will be accepted unless zumastor
has proven itself in the field.  We're working on
increasing our usability and performance now
to attract more users.  i.e. we're slowly making our ubuntu
packages (including the kernel flavor) follow all the
debian and ubuntu rules, and are now building them
in a ppa at launchpad for hardy.   We also have fairly
good Gentoo support.  (Sorry, we didn't have any Fedora
people on the project, so no Fedora packaging yet.)
- Dan
