Date: Wed, 1 Nov 2006 16:07:06 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvcreate succeeds but vgcreate cannot read label
Message-ID: <20061101160706.GA13623@agk.surrey.redhat.com>
References: <Pine.LNX.4.64.0610181244350.15257@saturn.retrosnub.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0610181244350.15257@saturn.retrosnub.co.uk>
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
Content-Transfer-Encoding: 7bit
To: Malcolm Scott <linux-lvm+Malcolm.Scott@cl.cam.ac.uk>
Cc: linux-lvm@redhat.com

On Wed, Oct 18, 2006 at 01:01:06PM +0100, Malcolm Scott wrote:
>   /dev/hda6 not identified as an existing physical volume

> What could cause this?
 
> The system is running Ubuntu Edgy, with the following versions:
 
> mas90@neptune ~ $ sudo lvm version
>   LVM version:     2.02.06 (2006-05-12)

Looks like a known bug in upstream 2.02.06 - try upgrading.

Alasdair
-- 
agk@redhat.com
