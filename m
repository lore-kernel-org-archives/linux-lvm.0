Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
References: <wxx3d0d2czp.fsf@nommo.uio.no>
    <20020207220832.GA4116@wookimus.net>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <20020207220832.GA4116@wookimus.net>
Message-Id: <wxxsn8c1vx1.fsf@nommo.uio.no>
MIME-Version: 1.0
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
Date: Thu Feb  7 21:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

"Chad C. Walstrom" <chewie@wookimus.net> writes:

> On Thu, Feb 07, 2002 at 10:33:46PM +0100, Terje Kvernes wrote:
> >   fdisk is only able to address 128GiB, that's rather obvious.  if I
> >   make one partition, 
> 
> Why make a partition at all?  Why not just make a physical volume out of
> the whole disk?

  like I said, if I pvcreate the device itself, /dev/hdc,
  /proc/lvm/global then returns the size as 134152192KB.  so it's
  still off.  :/

-- 
Terje
