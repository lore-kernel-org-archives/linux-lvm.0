Return-Path: <bluca@comedia.it>
Date: Fri, 11 May 2001 17:56:09 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] SCSI/LVM problems after power outage
Message-ID: <20010511175609.A2896@colombina.comedia.it>
References: <DC5B1A21E9E7D211B0020090273AD628242BE0@summit15.corvallis.summit> <20010509093510.B4918@sistina.com> <3AFB9CB4.DEFEC342@wrkhors.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3AFB9CB4.DEFEC342@wrkhors.com>; from lembark@wrkhors.com on Fri, May 11, 2001 at 03:03:00AM -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 11, 2001 at 03:03:00AM -0500, Steven Lembark wrote:
>  - grab a spare disk.
>  - create an equally-sized partition.
>  - try to software mirror it.
if with software mirror you intend md, be warned that md
writes a raid superblock at the end of the partition
overwriting existing data.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
