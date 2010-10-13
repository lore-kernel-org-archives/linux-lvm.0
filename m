Message-ID: <4CB5908D.4040602@redhat.com>
Date: Wed, 13 Oct 2010 11:57:17 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <4BD43A85686FC34D819098DB1C3999D9B0C5CE17@orsmsx502.amr.corp.intel.com>
In-Reply-To: <4BD43A85686FC34D819098DB1C3999D9B0C5CE17@orsmsx502.amr.corp.intel.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] vgcreate fails with return value 5
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Riches Jr, RobertX M" <robertx.m.riches.jr@intel.com>

On 10/11/2010 07:21 PM, Riches Jr, RobertX M wrote:
> I=EF=BF=BDm running into an odd problem in which vgcreate fails with a re=
turn value or=20
> exit code of 5. It is called from a script that calls pvcreate twice to c=
reate=20
> two PVs, then immediately calls vgcreate to create the VG.

Exit status 5 just means "command failed":

$ grep -r ECMD_FAILED ~/cvs/LVM2/lib/commands/errors.h
#define ECMD_FAILED		5

> An exit code of 5 appears to indicate excessive numbers of VGs. However, =
there=20
> are no other VGs on the system prior to this call to vgcreate. Search eng=
ine=20

There are hundreds of possible reasons for this error:

$ grep -r ECMD_FAILED ~/cvs/LVM2/ | wc -l
271

> results indicate the PV might be corrupt. However, the PV was just create=
d a few=20
> milliseconds before calling vgcreate.

The tools normally output a more descriptive error indicating what went
wrong. If for some reason you are not getting anything helpful add more
verbosity (e.g. -vvvv) to try to understand where it's failing.

Regards,
Bryn.
