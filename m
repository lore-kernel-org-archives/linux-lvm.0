From: Guido Guenther <agx@sigxcpu.org>
Subject: Re: [linux-lvm] Problem
Message-ID: <20021226131702.GE3302@bogon.ms20.nix>
References: <OFF86F1941.C6845D82-ON48256C9B.00297D99-48256C9B.00298FD5@ussmy>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFF86F1941.C6845D82-ON48256C9B.00297D99-48256C9B.00298FD5@ussmy>
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
Date: Thu Dec 26 07:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 26, 2002 at 03:33:46PM +0800, nellis@unionswitch.com.my wrote:
> I'm not sure what going on here . I want to setup my backup server using 
> LVM . I have two physical HDD named hda1 ( Linux native ) = 9.5GB , hda2 ( 
> Linux swap ) = 500MB and hdd1( LVM == 8e ) . I have error that looks like 
> this :
> 
> root@backupmy:/LVM# ./configure
> loading cache ./config.cache
> checking for mawk... mawk
> checking for gcc... gcc
> checking whether the C compiler (gcc  ) works... no
> configure: error: installation or configuration problem: C compiler cannot 
> create executables.
Something with you C compiler is wrong, see config.log for details.
Can't you use the precompiled lvm that comes with your distribution?
 -- Guido
