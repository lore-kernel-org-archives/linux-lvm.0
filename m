From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Disk crash , LVM and ext2... (bis)
Message-ID: <20020925075113.GK1291@tykepenguin.com>
References: <3D90EBDA.5070605@free.fr> <20020925071843.GI1291@tykepenguin.com> <3D91674F.3040601@free.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D91674F.3040601@free.fr>
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
Date: Wed Sep 25 02:57:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 25, 2002 at 09:35:43AM +0200, Emmanuel Varagnat wrote:
> Patrick Caulfield wrote:
> >
> >LVM1 can't retrieve data from a VG with a crashed PV (That's what your 
> >backups
> >are for).
> >
> >LVM2 can if you active the VG with the -P (--partial) flag. LVM2 can read 
> >LVM2
> >metadata.

I meant, of course, that LVM2 can read LVM1 metadata :-)
 
> This system was on a Slackware 8.0, with a 2.4.18 kernel and LVM 
> compiled by myself (can't remember the version).
> 
> I'm gonna take a look a this.

Don't forget, you'll need the "device-mapper" kernel patches too. They work best
with 2.4.19 kernels, there were VM problems with 2.4.18 ones.

-- 

patrick
