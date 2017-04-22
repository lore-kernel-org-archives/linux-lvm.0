MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 22 Apr 2017 09:14:20 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
Message-ID: <e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Xen <list@xenhideout.nl>, LVM general discussion and development <linux-lvm@redhat.com>

Il 14-04-2017 10:24 Zdenek Kabelac ha scritto:
> However there are many different solutions for different problems -
> and with current script execution - user may build his own solution -
> i.e.  call
> 'dmsetup remove -f' for running thin volumes - so all instances get
> 'error' device   when pool is above some threshold setting (just like
> old 'snapshot' invalidation worked) - this way user will just kill
> thin volume user task, but will still keep thin-pool usable for easy
> maintenance.
> 

This is a very good idea - I tried it and it indeed works.

However, it is not very clear to me what is the best method to monitor 
the allocated space and trigger an appropriate user script (I understand 
that versione > .169 has %checkpoint scripts, but current RHEL 7.3 is on 
.166).

I had the following ideas:
1) monitor the syslog for the "WARNING pool is dd.dd% full" message;
2) set a higher than 0  low_water_mark and cache the dmesg/syslog 
"out-of-data" message;
3) register with device mapper to be notified.

What do you think is the better approach? If trying to register with 
device mapper, how can I accomplish that?

One more thing: from device-mapper docs (and indeed as observerd in my 
tests), the "pool is dd.dd% full" message is raised one single time: if 
a message is raised, the pool is emptied and refilled, no new messages 
are generated. The only method I found to let the system re-generate the 
message is to deactiveate and reactivate the thin pool itself.

Is this the correct method, or easier/better ones exist?

> But then there is number of cases ending with the case that
> you run out of metadata space that has the maximal size of
> ~16G so you can't even extend it, simply because it's
> unsupported to use any bigger size

Just out of curiosity, in such a case, how to proceed further to regain 
access to data?

And now the most burning question ... ;)
Given that thin-pool is under monitor and never allowed to fill 
data/metadata space, as do you consider its overall stability vs 
classical thick LVM?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
