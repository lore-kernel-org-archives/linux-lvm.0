From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] setting VG UUID
Message-ID: <20040123193151.GE29720@percy.comedia.it>
References: <20040107065801.A27995@cs.mcgill.ca> <20040122214923.GH3060@percy.comedia.it> <20040123133558.V18942@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040123133558.V18942@uk.sistina.com>
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
Date: Fri Jan 23 14:33:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 23, 2004 at 01:35:58PM +0000, Alasdair G Kergon wrote:
>On Thu, Jan 22, 2004 at 10:49:23PM +0100, Luca Berra wrote:
>> >After figuring out that my all my PVs were lacking UUIDs, I used this
>> >hack from Heinz to correct the situation:
>> >http://lists.sistina.com/pipermail/linux-lvm/2002-January/010521.html
>> >(Alasdair also kindly provided a patch to handle the situation in LVM2.)
>> is it possible to have a copy of this patch?
> 
>It's already in LVM2 CVS, together with patches to *change tools to let
>you change the UUIDs to new random ones (not to be used while any
>LVs are active).
>
thanks a lot
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
