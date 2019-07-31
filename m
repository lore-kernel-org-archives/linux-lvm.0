References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
	<20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
	<01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
	<20190731093328.ily6u3xgpbnovyen@jak-t480s>
	<dd20d3cf-36a8-167c-a46b-3f06bf27e079@redhat.com>
	<c327e92c17a00f327f1e7690fc820e4b@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d32d2815-d83e-f433-c523-15b776500c16@redhat.com>
Date: Wed, 31 Jul 2019 13:12:54 +0200
MIME-Version: 1.0
In-Reply-To: <c327e92c17a00f327f1e7690fc820e4b@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] Detect systemd at run-time in
	69-dm-lvm-metad.rules
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: Julian Andres Klode <julian.klode@canonical.com>

Dne 31. 07. 19 v 12:51 Gionatan Danti napsal(a):
> Il 31-07-2019 12:16 Zdenek Kabelac ha scritto:
>> When it appears to work on a system with a single disk really doesn't
>> make it 'clearly working' - we are providing solution for thousands
>> disks based heavily loaded servers as well, so there is not much wish
>> to 'hack-in' occasionally working fix.
> 
> Not related to the core question - just to ask if you really have servers with 
> thousands disks connected...
> Is this a (relatively) common scenario, so much to hamper very common one/few 
> disks system?
> No intention to flame - I am genuinely curious...


Yes - we usually learn about these issues in a hard way... ;)
I'd say some users exceeds even our imagination...

Zdenek
