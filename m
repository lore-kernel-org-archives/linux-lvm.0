From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Mounting ext3 snapshots
Message-Id: <20020325080036.GA16296@tykepenguin.com>
References: <Pine.LNX.4.44.0203242158260.19733-100000@junior.luna.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0203242158260.19733-100000@junior.luna.home>
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
Date: Mon Mar 25 02:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Mar 24, 2002 at 10:08:53PM -0700, Donald Thompson wrote:
> I'm trying to mount ext3 snapshot LV's, and having a bit of trouble. I
> could have sworn I read this become possible awhile back on one of the
> lists (maybe that was reiserfs?). Anyways I've attempted the following:
> 
> I'm using:
> debian 3.0
> mount 2.11n (debian package)
> LVM 1.0.1
> Kernel 2.4.18-pre7
> 
> I'm guessing I just have the wrong mount options...anyone have any
> pointers? TIA.
> 

You need to apply the VFS lock patch to the kernel. It's included in the LVM
source package.

patrick
