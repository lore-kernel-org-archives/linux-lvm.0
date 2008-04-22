Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MGspmn012758
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:54:51 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.178])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MGseoJ012544
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:54:40 -0400
Received: by py-out-1112.google.com with SMTP id a29so2637945pyi.0
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 09:54:40 -0700 (PDT)
Message-ID: <a71bd89a0804220954j7fc85c78md03999cd9a4b792d@mail.gmail.com>
Date: Tue, 22 Apr 2008 09:54:39 -0700
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Snapshot question...
In-Reply-To: <chaz20080422163820.GB6559@artesyncp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<1208880734.7871.86.camel@pc.ilinx>
	<chaz20080422163820.GB6559@artesyncp.com>
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

On Tue, Apr 22, 2008 at 9:38 AM, Stephane Chazelas
<stephane.chazelas@emerson.com> wrote:
>  actually I've spent the last 3 days trying to put zumastor (well
>  actually ddsnap as I didn't use zumastor in the end) in place
>  here.
>
>  The fact that there are user space daemons involved in the
>  process make it very difficult to use it for the root file
>  system. I had to use a number of hacks for that.

You're braver than us.  We haven't tried using it for the root fs yet.

>  Also, it seems that you can't snapshot a live (mounted) file
>  system as you would do with LVM2 unless you have setup that FS
>  beforehand as a virtual ddsnap device (LVM2 is able to suspend
>  the device, and reload it as a snapshot_origin for that, I
>  couldn't manage to do the same with ddsnap).

Hmm.  I'll bring up that use case with Dan Phillips, see what he says.

>  I also tried applying the patches to 2.6.25 and got some oops
>  (2.6.24.2 is fine though).
>
>  Once I've finalised it, I can post what I've come up with if
>  anyone is interested.

Please do (heck, post it to the zumastor list, too).
- Dan
