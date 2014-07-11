Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6BCspun002076
	for <linux-lvm@redhat.com>; Fri, 11 Jul 2014 08:54:51 -0400
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6BCslmB029135
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 11 Jul 2014 08:54:48 -0400
Received: by mail-lb0-f177.google.com with SMTP id u10so822873lbd.8
	for <linux-lvm@redhat.com>; Fri, 11 Jul 2014 05:54:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53BD71DA.7000801@redhat.com>
References: <CAAWpFTHEnzeC_K5WGwbUjaw8JE54AF8NAbfnQkHF0k=PysS=rw@mail.gmail.com>
	<53BD71DA.7000801@redhat.com>
Date: Fri, 11 Jul 2014 22:54:46 +1000
Message-ID: <CAAWpFTFehTVd2J7vq6w2Yo266fsh2anGGosv8PruBBbhmmQNdw@mail.gmail.com>
From: Alfredo De Luca <alfredo.deluca@gmail.com>
Content-Type: multipart/mixed; boundary=089e013d161e30dce004fdea72b9
Subject: Re: [linux-lvm] lvm2 conf on boot disk
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--089e013d161e30dce004fdea72b9
Content-Type: text/plain; charset=UTF-8

Hi Jack.
Thanks for that. I did pretty much what you said but not sure how to
re-create the initrd then install the grub.
Do you have a specific procedure?
I followed the procedure in attachment but it's slightly different
from what I am looking for.


On Thu, Jul 10, 2014 at 2:46 AM, Jack Waterworth <jack@redhat.com> wrote:
> There is no way to do an in-place convert from a partitioned device to LVM
> without losing data. I would recommend adding a new disk, reinstall the OS
> on the new disk with LVM, and then moving over any data that was required
> after installation.
>
> You may be able to do this in rescue mode within a chrooted environment, but
> things could get messy. Add the new device, build the lvm stack, copy over
> the data then chroot into the NEW lvm root. Mount everything appropriately,
> recreate the initrd and re-install grub onto the new disk.  Go in with the
> expectation that you may be fixing things after the reboot from rescue mode.
>
>   Jack Waterworth, RHCE
>   Senior Technical Support Engineer
>   Red Hat Global Support Services
>   919.610.2024 -- jack@redhat.com
>
> On 07/08/2014 05:56 AM, Alfredo De Luca wrote:
>>
>> Hi all.
>> I have red hat 5.7 with no lvm2 installed. Now I want to configure
>> lvm2 on the root and swap partition then later on adding a couple of
>> LUNs to create a VG
>> What's the best practice/procedure to install lvm2 on the boot disk?
>> Is it possible? I guess I have to run Linux CD in rescue mode
>>
>> Regards
>>
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
Alfredo

--089e013d161e30dce004fdea72b9
Content-Type: application/octet-stream; name=lvm
Content-Disposition: attachment; filename=lvm
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hxhib34e0

QS4pIEZpcnN0IENyZWF0ZSBhbiBMVk0gcGFydGl0aW9uOgoKIyBwdmNyZWF0ZSAvZGV2L3NkYjEg
IC0tLS0+Pj4gb3IgdGhlIGFueSBvdGhlciBkZXZpY2UgYXMgcGVyIHlvdXIgc2VydmVyLgojIHZn
Y3JlYXRlIHZnX25ld19yb290ICAvZGV2L3NkYjEKIyBsdmNyZWF0ZSAtTCA0RyAtbiBsdjAgdmdf
bmV3X3Jvb3QKIAoKQi4pIEZvcm1hdCB0aGlzIG5ldyBMVk0gcGFydGl0aW9uIHdpdGggZXh0MyBv
ciBleHQ0IChvciBhcyBuZWVkZWQpOgoKIyBta2UyZnMgLWogL2Rldi92Z19uZXdfcm9vdC9sdjAK
IAoKQy4pIENyZWF0ZSBhIG5ldyBtb3VudCBwb2ludCBhbmQgdGhlbiBtb3VudCB0aGUgTFZNIFBh
cnRpdG9uIG9uIGl0OgoKIyBta2RpciAvbW50L05FV19ST09UX1BBUlRJVElPTgojIG1vdW50IC9k
ZXYvdmdfbmV3X3Jvb3QvbHYwICAvbW50L05FV19ST09UX1BBUlRJVElPTgoKCkQuKSBDb3B5IGFs
bCBjb250ZW50cyBvZiAiLyIgdG8gdGhlIG5ld2x5IG1vdW50ZWQgZm9sZGVyOgoKIyB0YXIgLWN2
cGYgLSAtLW9uZS1maWxlLXN5c3RlbSAtLWFjbHMgLS14YXR0cnMgLS1zZWxpbnV4IC8gfCB0YXIg
LUMgL21udC9ORVdfUk9PVF9QQVJUSVRJT04gLXhmCiMgY3AgLWF1eCAvZGV2IC9tbnQvTkVXX1JP
T1RfUEFSVElUSU9OCgoKRS4pIE5vdyBlZGl0IHRoZSBmaWxlIC0tICIvbW50L05FV19ST09UX1BB
UlRJVElPTi9ldGMvZnN0YWIiIHRvIHJlZmxlY3QgdGhlIG5ldyByb290OgoKL2Rldi92Z19uZXdf
cm9vdC9sdjAgICAgICAgICAgICAvICAgICAgICAgICAgICAgICAgICAgICBleHQzICAgIGRlZmF1
bHRzICAgICAgICAxIDEKCiAKCkYuKSBOb3cgaXQgaXMgbmVlZGVkIHRvIGNocm9vdCB0byBuZXcg
ZmlsZXN5c3RlbSBhbmQgY3JlYXRlIGluaXRyZCB3aXRoIHJhaWQgYW5kIGx2bSBzdXBwb3J0OgoK
IyBtb3VudCAtLWJpbmQgL2RldiAgL21udC9ORVdfUk9PVF9QQVJUSVRJT04KIyBjaHJvb3QgL21u
dC9ORVdfUk9PVF9QQVJUSVRJT04KIyBtb3VudCAtdCBwcm9jIC9wcm9jIC9wcm9jCiMgbW91bnQg
LXQgc3lzZnMgL3N5cyAvc3lzCgojIHZnc2NhbgojIHZnY2hhbmdlIC1heQojIG1raW5pdHJkIC12
IC9ib290L2luaXRyZC1gdW5hbWUgLXJgLmx2bS5pbWcgYHVuYW1lIC1yYAogICAKIyB1bW91bnQg
L3N5cwojIHVtb3VudCAvcHJvYwojIGV4aXQKIyBtdiAvbW50L2x2MC9ib290L2luaXRyZC1gdW5h
bWUgLXJgLmx2bS5pbWcgL2Jvb3QKCgpHLikgRWRpdCAiL2Jvb3QvZ3J1Yi9ncnViLmNvbmYiIHRv
IHBvaW50IHRvIG5ldyByb290ICIvZGV2L3ZnX25ld19yb290L2x2MCIuIEJhY2t1cCB0aGUgb2xk
IGluaXRyZCBpbiAiL2Jvb3QiIGRpcmVjdG9yeSBhbmQgcmVuYW1lIHRoZSBuZXcgaW5pdHJkIHRv
IHRoZSBleGlzdGluZyBvbmUgb3IgZWRpdCB0aGUgZW50cnkgaW4gZ3J1Yi5jb25mLgoKIAoKSC4p
IFJlYm9vdAoKCg==
--089e013d161e30dce004fdea72b9--
