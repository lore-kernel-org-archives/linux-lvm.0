From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Patching Kernel 2.4.13 (with LVM patch 1.0.1.rc4 and XFS 1.0.1)
Message-ID: <20011031102752.A634@tykepenguin.com>
References: <NEBBKOJLIGMCKNCJJACPOEPFGHAA.joost@e-cube.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NEBBKOJLIGMCKNCJJACPOEPFGHAA.joost@e-cube.nl>; from joost@e-cube.nl on Wed, Oct 31, 2001 at 10:57:03AM +0100
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
Date: Wed Oct 31 04:26:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 31, 2001 at 10:57:03AM +0100, Joost van der Locht wrote:
> Hello,
> 
> I try to patch a 2.4.13 Kernel with the LVM 1.0.1.rc4 patch and XFS 1.0.1
> patch. Now I
> get some errors that some patches already have been applied.
> 
> It asks for Assume -R?
> 

Say No and ignore that part of the patch.

XFS contains a newer (than that in 2.4.13) LVM so the Makefile changes that
the patch builder wants to do are already incorporated.

patrick
