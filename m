From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] setting VG UUID
Message-ID: <20040123072555.GA234@percy.comedia.it>
References: <20040107065801.A27995@cs.mcgill.ca> <20040122214923.GH3060@percy.comedia.it> <20040122205210.A12508@cs.mcgill.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040122205210.A12508@cs.mcgill.ca>
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
Date: Fri Jan 23 02:27:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 22, 2004 at 08:52:10PM -0500, Navindra Umanee wrote:
>Luca Berra <bluca@comedia.it> wrote:
>> >After figuring out that my all my PVs were lacking UUIDs, I used this
>> >hack from Heinz to correct the situation:
>> >
>> >http://lists.sistina.com/pipermail/linux-lvm/2002-January/010521.html
>> >
>> >(Alasdair also kindly provided a patch to handle the situation in LVM2.)
>> 
>> is it possible to have a copy of this patch?
>
>Up to Alasdair...  have you seen this problem too?
not personally, but i had some bug reports of similar problems.

>Remember, if your PV is lacking UUIDs, your VG probably is too and
>that's going to cause problems as well.  
yes, thanks for the useful info.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
