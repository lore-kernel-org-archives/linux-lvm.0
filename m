References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<1254de44dee90c91a37681cdbef15e44@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <292e0668-ec63-133b-8eb2-d05e00c3b5be@redhat.com>
Date: Wed, 13 Sep 2017 10:33:53 +0200
MIME-Version: 1.0
In-Reply-To: <1254de44dee90c91a37681cdbef15e44@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: Xen <list@xenhideout.nl>

D     # fsfreeze <mnt_point>
>>
>> The above should have the result you want - essentially locking out
>> all non-critical file systems.  The admin can easily turn them back on
>> via fsfreeze one-by-one as they resolve the critical lack of space.
>> If you find this too heavy-handed, perhaps try something else for
>> <command> instead first.
> 
> Very good suggestion. Actually, fsfreeze should works without too much drama.
>

Think about this case:

original volume with number of timely taken snapshots.

If you ONLY use 'read-only' snaps - there is not much thing to do - writing to 
the origin gives you quite 'precise' estimation how much data are in progress.
(seeing amount of dirty-pages....)

However when all other snapshots  (i.e. VM machines) are in-use and also do 
have writable data in progress -  invoking 'fsfreeze'  operation has 
unpredictable amount of provisioning in front of you (all your dirty pages 
needs to be first committed on your disk)...

So you can easily 'freeze' yourself in 'fsfreeze'.

lvm2 has got over last year much smarter - and avoids i.e. flushing in case 
it's queering of used 'data-space'  with 2 consequences:

a) it prevents 'dead-lock' in suspending with flushing (and holding lvm2 VG 
locking - which was really bad bad bad problem....  as you could not run 
'lvextend' for thin-pool in such case to rescue situation (i.e. you still have 
free space in VG - or even extend your VG...

b) gives you some 'historical/unprecise/async' runtime data of thin-pool fullness

So you can start to see that doing some 'perfect'  decision with historical 
data is not easy task...


Reagards


Zdenek
