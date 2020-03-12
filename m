References: <CH2PR18MB32064A3308D7D5BB3556EC47CFFD0@CH2PR18MB3206.namprd18.prod.outlook.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <401e66df-4d5d-a13c-8982-22896520908c@redhat.com>
Date: Thu, 12 Mar 2020 10:36:01 +0100
MIME-Version: 1.0
In-Reply-To: <CH2PR18MB32064A3308D7D5BB3556EC47CFFD0@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Do we have a way to clone the customer lvm2
	environment?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <GHe@suse.com>

Dne 12. 03. 20 v 5:54 Gang He napsal(a):
> Hi Guys,
> 
> Sometimes we encountered some lvm2 meta-data damage (by lvm2 commands) problems.
> Do we have a way to clone (or dump) the customer lvm2 environment? such like file system e2image tool.
> for example, we can dump each pv(meta data + data(with file hole)) to a file,
> next we can rebuild the cloned lvm2 environment in local machine.
> then, we can verify the fix in local machine with the tentative rpms before give them to the customers.
> 
> Any suggestions for this kind of case?

Hi

Such 'clone' of layout (without actual data) would only work with some basic 
lvm2 segtypes  (linear/stripe).
There is no easy way to 'clone' i.e. thin-pools, raids, caches, snapshots...)

All these complex type have it's own kernel metadata stored with metadata 
device which are 'invisible' to lvm2.

Also what would be a 'clone' a thin-pool with thin LVs without meaningful data 
right ?

ThinLV has an DeviceId which needs to match with kernel thinpool metadata.

Raid legs have their own metadata keeping internal state of raid device....

So my advice how to handle such case is to analyze existing 'lvs' output - see 
which devices likely do matter for actual 'cloning' and just recreate them
with proper lvcreate commmand.

The other way is to use plain 'DD' mechanism for the whole disk.


Regards

Zdenek
