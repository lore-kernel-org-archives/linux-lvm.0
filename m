From: Anders Widman <andewid@tnonline.net>
Message-ID: <8110365212.20030505180845@tnonline.net>
Subject: Re: [linux-lvm] Trouble with pvmove
In-Reply-To: <20030505155456.GA549@guldukat>
References: <001401c31014$efdcc840$0100a8c0@andre6xtbp6uza>
 <20030503114458.GB541@guldukat> <001801c3131b$2acd7ae0$0100a8c0@andre6xtbp6uza>
 <20030505155456.GA549@guldukat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon May  5 11:07:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> On Mon, 05.05.03, Andre? ?str?m <andree.astrom@home.se> wrote:

>> We were using 1.0.4, so updated to 1.0.7 today. No luck tough. Computer
>> locks up completly at
>> certain PE's.

> You could try to use 'dd' to backup the damaged pv to a new (equally-sized)
> partition, using 'conv=noerror' option to skip faulty blocks.

Or   even  a  better  tool  specifically  made  for this; dd_rescue :)
Simple, fast and secure.

> Perhaps you could use strace or on of the debugging options of pvmove to
> determine wher it locks. I suspect it locks trying to read the faulty block
> over and over again.

> good luck,

> Nils



   



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt
