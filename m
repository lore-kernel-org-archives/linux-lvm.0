Message-ID: <5396C25B.1060407@redhat.com>
Date: Tue, 10 Jun 2014 10:31:23 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <53924E22.60403@mooluv.com> <53958348.3000501@redhat.com>
	<5395CA79.90508@mooluv.com>
In-Reply-To: <5395CA79.90508@mooluv.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm Bug? - bad reaction to snapshot creation
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
To: LVM general discussion and development <linux-lvm@redhat.com>, me@mooluv.com

Dne 9.6.2014 16:53, Leeman Strout napsal(a):
> On 06/09/2014 05:50 AM, Zdenek Kabelac wrote:
>> Dne 7.6.2014 01:26, Leeman Strout napsal(a):
>> Hi
>>
>> Unsure if this relates to all your problem (since I'm not sure how
>> arch linux is in sync with udev rules & systemd version)
>>
>> At certain moment systemd added a new 'feature' about locking
>> devices while updating internal udev state - this locking ignores any
>> udev rule flags and opens internal lvm2 devices - so while for now
>> it's been again disabled for 'dm' devices - you might have installed
>> version of system which has the 'lock everything' feature in?
> systemd 213-6 is what Arch reports, as far as I can tell from the PKGBUILD
> it's vanilla 213 plus 2 patches:
> - backport fix for faily MACAddress matching (FS#40675)
> - backport fix for fsck/udev mess (FS#40706)


this commit should be fixing problems for lvm2 & latest systemd:

e918a1b5a94f270186dca59156354acd2a596494

and this is systemd commit which has introduced problem:

3d06f4183470d42361303086ed9dedd29c0ffc1b

Unsure what do you have in your arch build.

>> Thought this doesn't explain your 'counter below zero' error - this
>> looks like some incorrect udev rules are running in the field ? (Or
>> maybe multiple systemd-udevd are running ?)
> After a clean restart of everything twice without doing snapshots, the initial
> lvcreate does not have the 'counter below zero' error.  And with special
> attention to make sure the snapshots are cleaned up prior to attempting a new
> snapshot I am not getting this initial decrement on lvcreate.

So could we consider this  'counter' case is solved ?

Zdenek
