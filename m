From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm2 support in kernel - regular lvm on disks
Message-ID: <20021014072352.GA1394@tykepenguin.com>
References: <F13FRaqbC8wSA1XvpFV00000005@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F13FRaqbC8wSA1XvpFV00000005@hotmail.com>
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
Date: Mon Oct 14 02:31:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 14, 2002 at 01:39:26PM +0800, Peter Hoeg wrote:
> hi,
> 
> have searched through the archives at sistina.com as well as google, but 
> yet to no avail.
> 
> does anybody know if it is possible to boot a LVM2 enabled kernel (say the 
> latest 2.5.42-ac1) and use that with a machine with regular LVM (1.0.5) 
> created volumes? also, if i install the lvm2 tool for debian, they are 
> conflicting with my lvm1 tools, so are the new tools backwards compatible?

The reason the two packages conflict is because they have binaries with the
same names. Apart from snapshots LVM2 will read LVM1 volumes.
 
> thank you very much in advace - please do cc me on any answers,
> peter



patrick
