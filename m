References: <9fdc2f47-a4db-f472-e1eb-424f6a6b28d9@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b43b63a0-440f-3270-aeb5-dd8cf99ffcf0@redhat.com>
Date: Mon, 9 Dec 2019 10:40:24 +0100
MIME-Version: 1.0
In-Reply-To: <9fdc2f47-a4db-f472-e1eb-424f6a6b28d9@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] It looks wrong for the timeout when lvm test running
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Heming Zhao <heming.zhao@suse.com>

Dne 09. 12. 19 v 10:20 Heming Zhao napsal(a):
> Hello List,
> 
> The lvm test default timeout (--timeout) default value is 180.
> But I met below condition when running testcase (in virtual machine):
> ```
> make check_local T=shell/snapshot-merge.sh
>      ... ...
> ###       passed: [ndev-vanilla] shell/snapshot-merge.sh 665
>      ... ...
> ```
> 
> Obviously, the timeout doesn't work normally.
> If I change below code, the timeout work as expected. (in lib/brick-shelltest.h)
> ```
>           if ( select( nfds, &set, NULL, NULL, &wait ) > 0 ) {
>               silent_start = end; /* something happened */
>               io.sync( false );
>           }


Hi


Can you please provide (compressed) output of:

'make check_local T=snapshot-merge.sh VERBOSE=1 LVM_TEST_AUX_TRACE=1'

Thanks

Zdenek
