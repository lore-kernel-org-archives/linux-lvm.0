Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Re: GRUB + LVM + XFS?
References: <1010427293.29260.3.camel@UberGeek>
    <E16QVJv-0003Zk-00@hermes.sistina.com>
    <20020115153547.GB1022@tykepenguin.com>
In-Reply-To: <20020115153547.GB1022@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16QW0g-0005xW-00@hermes.sistina.com>
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
Date: Tue Jan 15 10:01:03 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, Patrick Caulfield <caulfield@sistina.com>

On Wed, 16 Jan 2002 01:35, Patrick Caulfield wrote:
> Looking at other threads in this list I think the issues are XFS related. I
> have tried the latest XFS patches from
>
> ftp://oss.sgi.com/projects/xfs/download/patches/2.4.17/
>
> and the snapshots seem OK to me (that's without the VFS lock patch which
> XFS doesn't seem to need anyway).

The original issue was getting ext3, resierfs & XFS coexisting.  I ran tests 
with almost all possible combinations of 2.4.17-xfs & lvm-1.0.1rc4 / 
lvm-1.0.1 CVS.  It would always be that one filesystem was fine but others 
would fail etc...

-- 
Adrian Head

(Public Key available on request.)
