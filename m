Message-ID: <20040116225419.11044.qmail@web41507.mail.yahoo.com>
From: Rajesh Saxena <rs_404@yahoo.ca>
Subject: Re: [linux-lvm] JFS or XFS
In-Reply-To: <20040116110810.GD2837@redhat.com>
MIME-Version: 1.0
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
Date: Fri Jan 16 17:55:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

 --- Heinz Mauelshagen <mauelshagen@redhat.com> wrote: 

> you need to apply the VFS-Lock patch from our web site to avoid your
> following 'trick'. That enables LVM to 'flush' all pending fs io
> before activating the snapshot.

ok I will have to look into that this weekend. Just to point something
out I am most likely looking in wrong place but I can't find patch for
kernel 2.4.21 here
http://tech.sistina.com/cgi-bin/viewcvs.cgi/LVM/PATCHES/

> Another option is to try out LVM2/device-mapper which
> supports writable snapshots :)

I was under impression that LVM2 and device-mapper are dependant on
kernel 2.6 which I don't feel comfortable using for server. I am
curious which filesystem you prefer with LVM 1 since you are the "The
LVM Guy" =)

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
