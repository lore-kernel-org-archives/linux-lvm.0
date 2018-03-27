References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
	<CAD+pdNdPKmHb7BQfT4DUj2M+=yy1P3JYtXO4GjNRXn2QA_cwwA@mail.gmail.com>
	<5ABA4D6D020000F9000B1E44@prv-mh.provo.novell.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <9d5323b7-73e7-0112-8e94-58613abe783a@redhat.com>
Date: Tue, 27 Mar 2018 10:32:45 +0200
MIME-Version: 1.0
In-Reply-To: <5ABA4D6D020000F9000B1E44@prv-mh.provo.novell.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

Dne 27.3.2018 v 07:55 Gang He napsal(a):
> Hi Fran,
> 
> 
>>>>
>> On 26 March 2018 at 08:04, Gang He <ghe@suse.com> wrote:
>>> It looks like each PV includes a copy meta data for VG, but if some PV has
>> changed (e.g. removed, or moved to another VG),
>>> the remained PV should have a method to check the integrity when each
>> startup (activated?), to avoid such inconsistent problem automatically.
>>
>> Your workflow is strange. What are you trying to accomplish here?
> I just reproduced a problem from the customer, since they did virtual disk migration from one virtual machine  to another one.
> According to your comments, this does not look like a LVM code problem,
> the problem can be considered as LVM administer misoperation?
> 
> Thanks
> Gang


Ahh, so welcome Eric's replacement  :)

Yes - this use scenario was improper usage of lvm2 - and lvm2 has cached the 
user before he could ruing his data any further...


Regards


Zdenek
