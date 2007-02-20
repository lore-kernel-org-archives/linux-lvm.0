Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KH3xRC027150
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 12:03:59 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.232])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1KH3vxv021572
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 12:03:57 -0500
Received: by wr-out-0506.google.com with SMTP id i23so2073283wra
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 09:03:57 -0800 (PST)
Message-ID: <859a78260702200903o14188cb1hf874d589c5204698@mail.gmail.com>
Date: Tue, 20 Feb 2007 11:03:56 -0600
From: "Matt P" <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] Re: LVM + Multipathing
In-Reply-To: <20070220131909.GA26642@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <3nmja4-jtv.ln1@www.researchut.com>
	<20070220061150.GA3215@percy.comedia.it>
	<186ra4-8hp.ln1@www.researchut.com>
	<20070220131909.GA26642@percy.comedia.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Your problem might be related to this bug
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=213921

On 2/20/07, Luca Berra <bluca@comedia.it> wrote:
> On Tue, Feb 20, 2007 at 06:00:25PM +0530, Ritesh Raj Sarraf wrote:
> >Luca Berra wrote:
> >
> >> On Sat, Feb 17, 2007 at 09:52:27PM +0530, Ritesh Raj Sarraf wrote:
> >>>Hi,
> >>>
> >>>I have a question regarding the combination of LVM + Multipathing in a SAN
> >>>environment.
> >>>
> >>>I have a LUN mapped to a host using iSCSI. I have two two paths to the LUN.
> >>>This setup, using multipathing, provides me failover functionality.
> >>>
> >>>My question is how does LVM react to path failures ?
> >>>In a failover environment, multipathing can take upto 120 seconds to detect
> >>>that the active path to the LUN is no more available and then switch to the
> >>>secondary path. During this 120 seconds, how does LVM react ? Does it really
> >>>sense that the device is offlined ? Or that information is never passed to LVM
> >>>and it just allows I/O to happen leaving that responsibility to the
> >>>multipathing layer ?
> >>
> >> i believe LVM does not react at all.
> >>
> >
> >I brought this question because I'm seeing Filesystem READONLY issues when doing
> >a takeover/giveback.
> >
> >My understanding is that a filesystem usually goes read-only, only when it
> >senses errors in the drive. Now I believe LVM might the culprit because beneath
> >the filesystem and above the block device, LVM is the only layer.
> to clarify my point above:
> i meant that LVM (actually device-mapper) does not do anything special.
> it just passes the IO requests from the fs layer to the
> underlying block device and if the underlyng block device returns an IO
> error then it is passed back to the fs. which will cause ext2 to remount
> the filesystem readonly.
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
