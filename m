From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Reiser & snapshots
Message-ID: <20020709071916.GG842@tykepenguin.com>
References: <Pine.LNX.4.21.0207081527110.7706-100000@enterprise.sd73.bc.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0207081527110.7706-100000@enterprise.sd73.bc.ca>
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
Date: Tue Jul  9 02:19:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jul 08, 2002 at 03:31:32PM -0700, John_Cuzzola wrote:
> 
> Hello everyone,
>  I'm new to this list and I was hoping someone could answer the following
> question. My setup:
> 
> 
> LVM-1.0.4
> Kernel: 2.4.17
> FileSystem: Reiser
> 
> 
> When I take a snapshot of a mounted reiser volume the resulting snapshot
> is corrupt. If the volume is unmounted then I take the snapshot it seems
> to be fine. I've searched the web and found that this is a known problem
> however the fix was to apply a VFS patch. The patch was for 2.4.11 and I
> couldn't find one for 2.4.17. Is snapshots of mounted reiser volumes still
> a problem? Will upgrading to 2.4.18 kernel fix it?

You could try the VFS lock patch for 2.4.11 on 2.4.17. If you upgrade to 2.4.18
then get the VFS lock patch from

http://tech.sistina.com/cgi-bin/cvsweb.cgi/~checkout~/LVM/PATCHES/linux-2.4.18-VFS-lock.patch?rev=1.1

rather than the 1.0.4 release.

However, I think 2.4.19rc1 might be a better kernel (it's what I'm running - I
went from 2.4.17), the VFS lock patch for that kernel is at

http://tech.sistina.com/cgi-bin/cvsweb.cgi/~checkout~/LVM/PATCHES/Attic/linux-2.4.19-VFS-lock.patch?rev=1.1.2.1


patrick
