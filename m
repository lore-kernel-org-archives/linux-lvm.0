Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
References: <200201020451.g024pPg00867@oss.sgi.com>
    <E16Oh1M-0003UB-00@hermes.sistina.com>
    <20020110152713.GC1018@tykepenguin.com>
In-Reply-To: <20020110152713.GC1018@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16Omcq-0004AU-00@hermes.sistina.com>
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
Date: Thu Jan 10 15:21:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, Patrick Caulfield <caulfield@sistina.com>

On Fri, 11 Jan 2002 01:27, Patrick Caulfield wrote:
>
> When a snapshot gets full it can no longer be valid so LVM makes it
> inactive and fails any further I/O to it.
>
> Because there's no more space for copy-on-write operations into the
> snapshot there's no way the filesystem can be consistent. OK this isn't
> that nice but it's arguably better than returning corrupted data.

Thanks Patrick for you response.  If this is the correct behaviour then 
everything is fine.  I just asked so I could find out.  :-)

Everything looks mighty fine.  Thanks everyone for your time and effort.

-- 
Adrian Head

(Public Key available on request.)
