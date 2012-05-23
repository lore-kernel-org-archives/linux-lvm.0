Mime-Version: 1.0 (Apple Message framework v1084)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <56453.172.16.0.29.1337716744.squirrel@beer.org.uk>
Date: Wed, 23 May 2012 10:16:09 -0500
Message-Id: <2D57E4F5-D031-4431-A085-F846CE8BBA9E@redhat.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<9014EE43-9993-4CA7-B3B0-B1F85B668206@redhat.com>
	<56453.172.16.0.29.1337716744.squirrel@beer.org.uk>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Fun and games with mirroring
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
To: lvm@beer.org.uk, LVM general discussion and development <linux-lvm@redhat.com>


On May 22, 2012, at 2:59 PM, Vic wrote:

> 
>> LVM requires that for an LV to be activated while there are missing PVs,
>> the '--partial' flag must be used.  If the script running vgchange does
>> not include '--partial', your mirror won't be activated.
> 
> I tried that. It didn't work.

Pardon me, but I was only half way done with my explanation at that point.  The solution I was proposing to the problem began with "It seems to me that the solution might be...".  I described the difference between the two mirroring solutions so that it would be clear that solving this issue is probably not as simple as adding a '--partial' flag.

It would be very important to distinguish between the two mirror types and other LV types - linear for example.  The start-up scripts would probably be wise to automatically handle the case you are describing.  (I agree, you should be able to kill one of your devices while the machine is down and it should come up fine.)  However, if you encounter a linear LV - as Bryn mentioned - perhaps we should abort or force the user to confirm that they'd like to attempt to continue.

 brassow
