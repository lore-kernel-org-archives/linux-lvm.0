Message-ID: <4E42E454.7000902@redhat.com>
Date: Wed, 10 Aug 2011 22:04:36 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <883D98939E388E429EE8D771168A6560027EE6AE1D@USCMIMAIL1.corp.amdocs.com>
In-Reply-To: <883D98939E388E429EE8D771168A6560027EE6AE1D@USCMIMAIL1.corp.amdocs.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] metadata copies
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jewsco Pius Jacquez <JewscoPius.Jacquez@Amdocs.com>

On 08/10/2011 06:30 PM, Jewsco Pius Jacquez wrote:
> If you have two metadata copies stored in one PV, how does the OS know which one is the legitimate copy?

Only one metadata copy is always active.

There is sequence ID (see seqno = X in metadata backup).
If there are several PVs and more versions of metadata present, the one with highest sequence ID
is used and other PVs are automatically updated to this version.

Every LVM operation which changes metadata also increases this sequence id.

Milan
