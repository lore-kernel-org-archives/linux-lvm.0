From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] Are there problems with same VG on same hard disk?
Message-ID: <20030409113519.GE1943@fib011235813.fsnet.co.uk>
References: <20030409112739.GA1244@glorybox>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030409112739.GA1244@glorybox>
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
Date: Wed Apr  9 06:39:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 09, 2003 at 01:27:39PM +0200, Kai Weber wrote:
> Hi,
> 
> Question: Is it good to have /dev/hdb1 /dev/hdb2 into the same Volume
> Group? I think I have read that VGs of the same group should not be on
> the same hard disk. Is this correct or a legend?

This is fine.  There are a couple of situations that you will have to
look out for when setting up LVs though:

1) Don't create a striped LV with the stripes on the same physical device.
2) Try not to create a snapshot on the same physical device as the origin.

Point 2 you can get away with, snapshot performance will just be poor.

- Joe
