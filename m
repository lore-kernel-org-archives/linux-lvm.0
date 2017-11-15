References: <CAGPRaYcTgU0pfSHhcV7aOzv-ohr=+=E7YgJs=USRTMe2-LNcAQ@mail.gmail.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <e43300f3-d19a-fae3-e6c3-54fe17ffee7c@redhat.com>
Date: Wed, 15 Nov 2017 10:25:28 +0100
MIME-Version: 1.0
In-Reply-To: <CAGPRaYcTgU0pfSHhcV7aOzv-ohr=+=E7YgJs=USRTMe2-LNcAQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvremove try to remove a WRONG logic volume!!!
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: BaiLin Times <balintimes@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 11/15/2017 04:26 AM, BaiLin Times wrote:
> root@d11:/home/sone# lvremove vg0 lv0v16

There's missing slash '/' in between VG name and LV name - you should
have used vg0/lv0v16. Without that slash, the name given means the whole
VG so the command you typed actually means "remove all volumes in volume
group vg0 and lv0v16".


> Do you really want to remove active logical volume vg0/lv0v15? [y/n]: y
>   Logical volume "lv0v15" successfully removed
> Do you really want to remove active logical volume vg0/lv0v00? [y/n]:
> ^C  Interrupted...
>   Logical volume vg0/lv0v00 not removed.
>   Interrupted...
>   Interrupted...
> 
> 
> 
> root@d11:/home/sone# lvremove vg1 vl1v16
>   Logical volume vg1/lv1uni contains a filesystem in use.
> Do you really want to remove active logical volume vg1/lv1win? [y/n]:
> ^C  Interrupted...
>   Logical volume vg1/lv1win not removed.
>   Interrupted...
>   Interrupted...
> 
> 
> 
> Inline image 1Inline image 2Inline image 3Inline image 4
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Peter
