References: <1771452279.913055.1505269434212.ref@mail.yahoo.com>
	<1771452279.913055.1505269434212@mail.yahoo.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <6fd32c58-e1ad-39d9-7ea4-98abc061e62a@redhat.com>
Date: Wed, 13 Sep 2017 09:25:31 +0200
MIME-Version: 1.0
In-Reply-To: <1771452279.913055.1505269434212@mail.yahoo.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 13.9.2017 v 04:23 matthew patton napsal(a):
> I don't recall seeing an actual, practical, real-world example of why this issue got broached again. So here goes.
> 
> Create a thin LV on KVM dom0, put XFS/EXT4 on it, lay down (sparse) files as KVM virtual disk files.
> Create and launch VMs and configure to suit. For example a dedicated VM for each of web server, a Tomcat server, and database. Let's call it a 'Stack'.
> You're done configuring it.
> 
> You take a snapshot as a "restore point".
> Then you present to your developers (or customers) a "drive-by" clone (snapshot) of the LV in which changes are typically quite limited (but could go up to full capacity) worth of overwrites depending on how much they test/play with it. You could have 500 such copies resident. Thin LV clones are damn convenient and mostly "free" and attractive for that purpose.
> 


There is one point which IMHO would be way more worth to invest resource into 
ATM whenever you have snapshot -  there is unfortunately no page-cache sharing.

So i.e. you have 10 LVs being snapshots of the single origin you get 10 
different copies of pages in RAM of the same data.

But this is really hard problem to solve...


Regards


Zdenek
