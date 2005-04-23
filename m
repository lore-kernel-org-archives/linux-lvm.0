Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3N7qNO08541
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 03:52:23 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3N7qLuo021979
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 03:52:21 -0400
Date: Sat, 23 Apr 2005 09:52:18 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Resizing root lvm
Message-ID: <20050423075218.GA20444@percy.comedia.it>
References: <4269D703.9030801@samera.com.py>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4269D703.9030801@samera.com.py>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Apr 23, 2005 at 01:02:59AM -0400, Oliver Schulze L. wrote:
>Hi,
>I just installed the trial of RHEL4, I noted that the autopartition selected
>a LVM configuration for the root partition.
>I wanted to know if it is posible to add a new partition and then resize the
>root partition.
>
>I have tryied but could not make the ext3 filesistem to grow. The lv have
>become bigger, but not the filesystem.
>
>How can I resize the filesystem too?
>
RH4 supports online resizing of filesystems, read the
release-notes
(http://www.redhat.com/docs/manuals/enterprise/RHEL-4-Manual/release-notes/as-x86/)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
