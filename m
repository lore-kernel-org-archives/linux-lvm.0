Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 21 Dec 2000 09:04:37 +0000
From: Patrick Caulfield <patrick@tykepenguin.com>
Subject: Re: [linux-lvm] '/etc/init.d/lvm' script in debian package
Message-ID: <20001221090437.D511@tykepenguin.com>
References: <0012210840470T.08762@lyta> <Pine.LNX.4.31.0012210915340.10260-100000@falka.mfa.kfki.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.31.0012210915340.10260-100000@falka.mfa.kfki.hu>; from dice@mfa.kfki.hu on Thu, Dec 21, 2000 at 09:37:58AM +0100
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Russell Coker <bofh@coker.com.au>

On Thu, Dec 21, 2000 at 09:37:58AM +0100, Gergely Tamas wrote:
> 
> A few ideas ...
> 1) if LVM is compiled into the kernel and /boot/System.map is reachable,
> than it could be detected using e.g. 'grep lvm System.map'
> 
> 2) if /usr/src/kernel/.config is reachable, than it could be detected
> using e.g. 'grep -i lvm .config'
> 
> 3) maybe doing a check for directories countaining 'group' in /dev would
> be a usable idea...

How about looking in /proc/devices for the lvm block & char devices ?

patrick
