From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] hello sir
Message-Id: <20020408071844.GB1321@tykepenguin.com>
References: <20020406183800.5697.qmail@eyou.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020406183800.5697.qmail@eyou.com>
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
Date: Mon Apr  8 02:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Apr 06, 2002 at 06:38:00PM +0800, seaward@eyou.com wrote:
> dear sir:
>     I am a lvm user in China. I found 2 bugs when I using it.
>     One: the patches of lvm-1.0.3 for kernel-2.4.18 has a wrong definition
> in
> lvm-internal.h:
> #define lvm_sectsize(dev) get_hardblocksize(dev)
> should change to
> #define lvm_sectsize(dev) get_hardsect_size(dev)

Sounds like the patch hasn't been generated correctly. 

Make sure you configured LVM with the right kernel directory:

./configure with-kernel_dir=/your/kernel/here

Then do a "make clean" and a "make" in the PATCHES directory.

-- 

patrick
