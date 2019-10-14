References: <CH2PR18MB32066B47726171588477EAC1CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
	<5b456c7b-13bf-b7fc-9347-eb54ccb6cc72@redhat.com>
	<CH2PR18MB32063E1556F117BA9B9F5285CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <f1ffa375-ac99-fc4c-3499-7b8432d3910f@redhat.com>
Date: Mon, 14 Oct 2019 12:55:38 +0200
MIME-Version: 1.0
In-Reply-To: <CH2PR18MB32063E1556F117BA9B9F5285CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] devices/dir configuration option in
 /etc/lvm/lvm.conf can be edited?
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
To: Gang He <GHe@suse.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 14. 10. 19 v 12:52 Gang He napsal(a):
> Hi Zdenek,
> 
> Thanks for explaining.
> That means we should tell the user, you should not edit this option (dir = "/dev") in the lvm.conf, right?
> 

Basically yes.

The option is there for 'skilled' users who know exactly how the whole 'device 
creation process' works - essentially these days this option is mostly useful 
only for some testing...


Regards

Zdenek
