Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
References: <wxx3d0d2czp.fsf@nommo.uio.no>
    <20020207151811.X15496@lynx.turbolabs.com>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <20020207151811.X15496@lynx.turbolabs.com>
Message-Id: <wxxk7to1urc.fsf@nommo.uio.no>
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
Date: Thu Feb  7 22:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas Dilger <adilger@turbolabs.com> writes:

> This is a kernel IDE driver limit.  You need to patch with Andre
> Hedrik's IDE patches to support IDE devices over this size.

  at least I'm not the only one who can't spell his name when looking
  for the patches, "Andre Hedrick".  right then.  I'm patching and
  compiling now. 

  aah...  thank you.  152.62GB.  now that looks more like the sort of
  Gib / GB tradeoff I can live with.  

-- 
Terje
