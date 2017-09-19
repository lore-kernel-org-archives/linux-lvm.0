References: <603627203.4607722.1505769042298.ref@mail.yahoo.com>
	<603627203.4607722.1505769042298@mail.yahoo.com>
	<3ff234d4-fbe3-64dc-2ae6-4566d69a8038@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b38f582d-fdc8-0825-29fb-f1684dcba8ab@redhat.com>
Date: Tue, 19 Sep 2017 13:11:09 +0200
MIME-Version: 1.0
In-Reply-To: <3ff234d4-fbe3-64dc-2ae6-4566d69a8038@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>, matthew patton <pattonme@yahoo.com>

Dne 19.9.2017 v 10:49 Gionatan Danti napsal(a):
> On 18/09/2017 23:10, matthew patton wrote:
>> If the warnings are not being emitted to STDERR then that needs to be fixed 
>> right off the bat.
> 
> The line with WARNINGs are written on STDERR, at least con recent LVM version.
> 
>> 'lvs -q blah' should squash any warnings.
>> 'lvcreate' frankly shouldn't output anything unless invoked with '-v' 
>> anyway. So therefore '-q' should also squash warnings.
> 
> I'm not sure this is the right approach. I do not expect "-q" to remove *all* 
> warnings, because warnings can be quite important.
> 


There are couple troubles - there are always a 'skilled  X  unskilled' users.
and also there are varying distro maintainers..

We are already facing some troubles when some distributions do make a changes 
to default configuration files which are not really ideal for 'default' users 
(in other words opinions about defaults are different - moreover based on 
wrong blog post from users...)

So we can introduce  i.e.  'novice_user = 1' in lvm.conf  - but it might be 
effectively dropped when package maintainer decides this way lvm2 makes less 
annoying messages around some commands.

But in case of thin-pool it's better to warn-ahead  instead of facing troubles 
later  (as full thin-pool is not going to be pleasant experience...)

So we are looking for some solution which cannot be easily 'hidden' for 
everyone - so we do not end with reports about 'hidden over-provisioning' 
causing system malfunctioning.  Yet it should be 'easy' to bypass it for 
skilled admin.


IMHO the most convenient in my eyes is a usage of some sort of 'envvar'
LVM_SUPPRESS_POOL_WARNINGS....


Since we already use similar logic to bypass i.e.  FD close() warnings
LVM_SUPPRESS_FD_WARNINGS
LVM_SUPPRESS_LOCKING_FAILURE_MESSAGES


Regards

Zdenek
