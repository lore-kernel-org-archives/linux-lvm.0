MIME-Version: 1.0
In-Reply-To: <20131202143911.GA5331@redhat.com>
References: <CADsoVx80SzPEnyyzmEFRppTHqBSsyuOuvN+q-eQAOxPd_VHgYg@mail.gmail.com>
	<20131202143911.GA5331@redhat.com>
From: Guilherme Moro <guilherme.moro@gmail.com>
Date: Mon, 2 Dec 2013 15:46:36 +0000
Message-ID: <CADsoVx9fstUhFt3tuZV+Me9xvjiTvm5uNjAecLq8ykE7wQPELg@mail.gmail.com>
Subject: Re: [linux-lvm] LVM snapshot merge and corrupted file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Snitzer <snitzer@redhat.com>
Cc: linux-lvm@redhat.com

Hi,
Thanks for the response.

On Mon, Dec 2, 2013 at 2:39 PM, Mike Snitzer <snitzer@redhat.com> wrote:
> On Mon, Dec 02 2013 at  6:41am -0500,
> Guilherme Moro <guilherme.moro@gmail.com> wrote:
>
>> Hi,
>>
>> I know that is a too broad question, but please be kind ;)
>> The scenario:
>> RHEL 6.2 - snapshot a disk mounted over multipath device mapper
>> Upgrade system to RHEL 6.4
>> Merge the snapshot to return the system to previous state.
>> System get unstable and rebooting cyclic (not reaching user-level, at
>> least the logs don't show it)
>> Spot a file that got more or less 1200 bytes corrupted (mostly turned to 0).
>
> The first rollback attempt was done in production?
No, this is a test system, and the actual procedure was tested dozen
of times without any issue (we never checksummed the files, but the
system never got in a failed state before), so this is why we think is
probably hardware related.
>
>> Sadly, I got called to the machine too late to recover the console
>> output of the reboot (it's a blade and no console logs was
>> configured), and could figure out if some hardware failure happened.
>>
>> As I don't have proper logs to further investigate my questions is:
>>
>> - There are any know issues around snapshotting in this conditions
>> (RHEL 6.2 -> RHEL 6.4, multipath)?
>
> Not aware of any.
This is great, the main reason for the e-mail was to confirm that no
known issue exists.
>
>> - There's any chance of this being a software failure (bug?) and do
>> the restore procedure warn me in the logs (/var/log/message?) about
>> any failure during the restore (even if hardware related).
>>
>> My main suspicion for now is a hardware failure somewhere, but I was
>> kindly asked to be sure that this can't be a bug.
>>
>> Any thoughts or pointers (docs, pieces of code, testing reports) would
>> be appreciate, so don't be shy :)
>
> The lvm2 testsuite has support for testing snapshot-merge; but it
> doesn't test layering snapshot ontop of multipath.
I supposed that, just confirming :)
>
> Without context (e.g. logs) for what happened it is really hard to say
> definitively whether or not you hit some software bug or if your problem
> was hardware failure like you suspect.
A snippet of the messages log is here http://pastebin.com/3k1y358N
But I couldn't spot anything weird, besides the fact that the logs
never go past that until some 4 hours later. (the syslog error goes
away after 2 hours, probably the right file get delivered by puppet in
the meantime, don't know how tho, but even this is not enough to get
logs further than that immediately). Anyway, didn't send the logs
before because they seem useless :)
Just on the other question, does LVM spit out any output if things
goes wrong during the restore?

We are hooking on our CI a test to snapshot -> upgrade -> restore,
with proper file checksum in place, so let's see if we can ever
reproduced it in normal operation.

Regards,

Guilherme Moro
