From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM 1.0.5 Debian Package : apt-get doesnt work
Message-ID: <20020925114126.GO1291@tykepenguin.com>
References: <3D919C3C.E7B15B85@cti-paysloire.cnamts.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D919C3C.E7B15B85@cti-paysloire.cnamts.fr>
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
Date: Wed Sep 25 06:51:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 25, 2002 at 01:21:32PM +0200, LEBRETON Philippe wrote:
> hello,
> 
> I want install LVM 1.0.5 on my Debian 3.0 and i add in my sources.list
> the url :
> deb ftp://fp.sistina.com/pub/LVM/binaries/debian unstable main
> 
> when i want update my package database, apt-get does'nt found Packages
> file.
> I think that the symbolic link from binary-i386 to ../..../0.9.1-beta7
> is not compatible wiht apt-get

lvm 1.0.4 is already in the Debian archive(the package name is lvm10), you
don't need to add anything to sources.list.

It has all the same userland code as LVM 1.0.5 (which was largely a kernel
bugfix release)

patrick
