Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m18CSWX2002073
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 07:28:32 -0500
Received: from hs-out-2122.google.com (hs-out-0708.google.com [64.233.178.242])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m18CSAQ0005053
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 07:28:10 -0500
Received: by hs-out-2122.google.com with SMTP id k27so3582443hsc.3
	for <linux-lvm@redhat.com>; Fri, 08 Feb 2008 04:28:05 -0800 (PST)
Message-ID: <a71bd89a0802080428h5c58abf5v8328a82a9f7d7487@mail.gmail.com>
Date: Fri, 8 Feb 2008 04:28:04 -0800
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] snapshots and filesystem freezing
In-Reply-To: <47AC455E.4030502@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <47AC455E.4030502@wpkg.org>
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

On Feb 8, 2008 4:04 AM, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
> Some filesystems, like xfs, have a "freeze" feature. There was a
> discussion on lkml about implementing it in ext3, too.
>
> What is the relationship between a filesystem freeze and LVM snapshots?
>
> As far as I understand, snapshotting a filesystem in any random
> timepoint can mean that the snapshotted fs will be inconsistent (i.e.,
> may need fsck).
> "Freezing" the filesystem will flush all writes to the media, and a
> snapshotted fs should be consistent then (in theory; without an
> interface between filesystem freeze and LVM snapshot it does not
> guarantee that the operation is "atomic").

Historically, executing sync() does most of what freeze does,
though there's a risk that some pesky process will go and do
a write (or some in-flight write will land) after the sync and before
you finish the snapshot.
XFS decided to be different; I think they wanted to shout out to the
world that the old sync() idea was racy, so they refused to implement
it properly, and introduced the theoretically safer freeze/thaw idea.
They may yet drag the rest of us kicking and screaming into the modern world.

Comments in
http://www.paragon-cs.com/wordpress/?p=67 mention that
one used to have to do the xfs freeze manually, but lvm2 now does it for you.
(It also mentions that you really want to manually quiesce your apps, too.)
- Dan
