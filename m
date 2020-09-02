References: <1597939504-31532-1-git-send-email-heming.zhao@suse.com>
	<ff41471a-d775-a314-434a-eac3fd0668a4@suse.com>
	<80e36f4c-8193-1df5-41ad-e0caf42f6537@redhat.com>
	<4bb3e590-39f1-75e7-9000-03d1d3fc0e73@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <66fe8fdc-3147-8a22-9a34-7201f4187be4@redhat.com>
Date: Wed, 2 Sep 2020 17:22:01 +0200
MIME-Version: 1.0
In-Reply-To: <4bb3e590-39f1-75e7-9000-03d1d3fc0e73@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] gcc: change zero-sized array to fexlible
	array
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, "heming.zhao@suse.com" <heming.zhao@suse.com>
Cc: dcermak@suse.com

Dne 29. 08. 20 v 5:11 heming.zhao@suse.com napsal(a):
> 
> These 3 zero-sized array blocked me to create lvm2 package for opensuse tumbleweed.
> Opensuse uses OBS (open build service: https://openbuildservice.org/) to create rpm packages.
> In my eyes, the OBS is black-box, it only showed these 3 warning and stopped building work.
> So I filed patch only about these 3 places.
> 
> the build error just related with [-Wstringop-overflow=]
> ```
> [   72s] In function 'strcpy',
> [   72s]     inlined from '_store_str' at device_mapper/libdm-common.c:1453:2,
> [   72s]     inlined from '_stack_node_op' at device_mapper/libdm-common.c:1589:2:
> [   72s] /usr/include/bits/string_fortified.h:90:10: warning: '__builtin_strcpy' writing 1 or more bytes into a region of size 0 overflows the destination [-Wstringop-overflow=]
> [   72s]    90 |   return __builtin___strcpy_chk (__dest, __src, __bos (__dest));
> ```
> 


Hi

So patches have've been pushed into master HEAD - so maybe you can try to 
validate whether this changes things for your builder server - we can then 
consider backporting to stable-2.0 branch.

Regards

Zdenek
