From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
Message-ID: <20030130120456.GJ802@tykepenguin.com>
References: <20030130115503.LFHJ14589.mta02-svc.ntlworld.com@[10.137.100.62]>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030130115503.LFHJ14589.mta02-svc.ntlworld.com@[10.137.100.62]>
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
Date: Thu Jan 30 06:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 30, 2003 at 11:55:03AM +0000, jrelist@ntlworld.com wrote:
> 
> Well, it's kind of working now ! I followed the link, got the patch. I patched lvm 1.0.6 to my kernel, ended up having to manually change lvm-snap.c, went throught the build and IPL'd successfully !
> 
> However, I'm now faced with another problem. After creating, then extending a VG, a subsequent vgscan gives 'segmentation error' and a pvscan now says the vg the devices are connected to is unknown. The rpm installed for the lvm utilities is 1.0.3-10, and from searching the lists I believe I need an updated version of VGSCAN. I know there won't be a binary available for s/390 redhat at 1.0.6 level, but I'd like to what would be the best SRPMS to get - I've seen a couple of different versions but nothing specifically mentioned as for a Redhat distro.
> 
> Thanks for your help so far, nearly there.... !
> 

I don't think there are any SRPMS (not official ones anyway), but the tar.gz
sources should build just fine.

-- 

patrick
